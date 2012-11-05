def export(model,excludes=nil)
  boards = model.all
  File.open("db/export/#{model}.t","w:utf-8") do |f|
    boards.each_with_index do |board,i|
      if excludes.present? && excludes.include?(board.number)
        next
      end
      s_file = "db/export/#{model}/subject_#{i}.html"
      u_file = "db/export/#{model}/user_name_#{i}.html"
      b_file = "db/export/#{model}/body_#{i}.html"
      subject = Okiconv.euckr_to_utf8(board.bbs_title)
      File.open(s_file,"w:utf-8") do |b|
        b.puts subject
      end
      user_name = Okiconv.euckr_to_utf8(board.bbs_name)
      File.open(u_file,"w:utf-8") do |b|
        b.puts user_name
      end
      expiry_day = SystemSetting.first.post_expiry_length
      expiry = board.bbs_date + expiry_day.days
      b_category = Okiconv.euckr_to_utf8(board.b_category)
      body = Okiconv.euckr_to_utf8(board.bbs_review)
      File.open(b_file,"w:utf-8") do |b|
        b.puts body
      end
      f.puts("#{i}\##{s_file}\##{u_file}\##{board.bbs_date}\##{expiry}\##{b_category}\##{b_file}")
    end
  end
end
