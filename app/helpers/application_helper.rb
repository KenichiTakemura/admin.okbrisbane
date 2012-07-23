module ApplicationHelper

  def version
    "Version 0.1"
  end
  
  def thumbnail(image, action)
    logger.debug("delete_action: #{action}")
    html = %Q|<div style="position: relative; float: left">|
    html += link_to(image_tag(image.avatar.url(:thumb), :class => 'thumbnail'), image.avatar.url(:original))
    html += %Q|<div style="position: absolute; top: 0px; left:90%;">|
    html += link_to(t('x'), action, method: :delete, data: { confirm: t('confirm_delete') })
    html += "</div></div>"
    html.html_safe
  end
  
  def noimage
    html = <<-HTML
    <img src="/assets/noimage.jpg" width=50px height=50px/>
    HTML
    html.html_safe
  end
  
  def _script_document_ready(script)
    html = %Q|<script type="text/javascript" charset="utf-8">$(document).ready(function() {#{script}});</script>|
    html.html_safe
  end
  
  def _truncate(expression)
    html = %Q|<span title="#{expression}">#{truncate(expression, :length => 30)}</span>|
    html.html_safe
  end
  
  def _upload(action, item_id)
    html = <<-HTML
    <style>
    \#dropbox {
      width: 300px;
      height: 100px;
      border: 1px solid gray;
      border-radius: 5px;
      padding: 5px;
      color: #41A317;
    }
  </style>
  <script type="text/javascript">
    window.onload = function() {
      var dropbox = document.getElementById("dropbox");
      dropbox.addEventListener("dragenter", noop, false);
      dropbox.addEventListener("dragexit", noop, false);
      dropbox.addEventListener("dragover", noop, false);
      dropbox.addEventListener("drop", dropUpload, false);
    };
    function noop(event) {
      event.stopPropagation();
      event.preventDefault();
    };
    function dropUpload(event) {
      noop(event);
      var files = event.dataTransfer.files;
      for (var i = 0; i < files.length; i++) {
        upload(files[i]);
      }
    };
    function upload(file) {
      $('\#dropbox_status').html("Uploading " + file.name);
      var formData = new FormData();
      formData.append("id", #{item_id})
      formData.append("file", file);
      formData.append("authenticity_token", $("input[name='authenticity_token']").attr("value"));
      var xhr = new XMLHttpRequest();
      xhr.upload.addEventListener("progress", uploadProgress, false);
      xhr.addEventListener("load", uploadComplete, false);
      xhr.open("POST", "/#{action}/upload", true);
      xhr.send(formData);
    };
    function uploadProgress(event) {
      var progress = Math.round((event.loaded / event.total) * 100);
      $('\#dropbox_status').html("Progress " + progress + "%");
    };
    function uploadComplete(event) {
      if (event.target.status != 200) {
        $('\#dropbox_status').html("<div class=\\"message error\\">"
        + "<p><strong>Oops!</strong> Could not handle request. </p></div>");
        return false;
      }
      data = JSON.parse(event.target.responseText);
      $('\#dropbox_status').html("<div class=\\"message notice\\">"
      + "<p><strong>" + data.result + "</strong></p></div>");
      images = data.images;
      var html = "";
      for (var i=0; i<images.length; i++) {
        html += "<img class=thumbnail src=\" + images[i] + \"/>";
      }
      $('\#_imagebox').html(html);
    };
  </script>
  <div class="flash">
  <div id="dropbox_status"></div>
  </div>
  <div style="postion:relative" id="dropbox">
    <p>
      <strong>#{I18n.t('please_drag_n_drop')}</strong>
    </p>
  </div>
   HTML
  html.html_safe
  end
  
end
