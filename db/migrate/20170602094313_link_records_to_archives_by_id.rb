class LinkRecordsToArchivesById < ActiveRecord::Migration[5.1]
  def up
    Authorship.all.each do |a|
      a.archive = Archive.find_by number: a.archive_number
      a.save
    end

    SentBibliography.all.each do |sb|
      sb.archive = Archive.find_by number: sb.archive_number
      sb.save
    end

    Archive.all.each do |archive|
      Archive.connection.execute("UPDATE archives_categories
                                  SET archive_id=#{archive.id}
                                  WHERE archive_number='#{archive.number}';")
    end
  end

  def down
    # Do nothing
  end
end
