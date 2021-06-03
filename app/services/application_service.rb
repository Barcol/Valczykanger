class ApplicationService
  def self.call(...)
    new(...).call
  end

  private

  def with_transaction(&block)
    ActiveRecord::Base.transaction(&block)
  end
end
