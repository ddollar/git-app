class ActiveRecord::Base

  def self.create_or_update(record, keys=[])
    keys = [:id] if keys.empty?

    keys.each do |key|
      raise "Data must contain key: #{key}" unless record.keys.include?(key)
    end

    columns = self.columns.map(&:name)

    conditions = keys.inject({}) do |memo, key|
      real_key = columns.include?("#{key}_id") ? "#{key}_id" : key
      memo.update({ real_key => record[key] })
    end

    records = self.find(:all, :conditions => conditions)

    raise "Keys matched more than one record" unless records.length < 2

    if records.empty?
      self.create!(record)
    else
      records.first.update_attributes!(record)
    end
  end

end
