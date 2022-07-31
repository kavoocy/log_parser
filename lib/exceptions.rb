# frozen_string_literal: true

class AbstractMethodError < StandardError
  MUST_IMPLEMENT = "You must implement %<callee>s in child class."

  def initialize(message=MUST_IMPLEMENT, _params={})
    msg = format(message, callee: __callee__)
    Logger.new($stdout).error(msg)
    super msg
  end
end
