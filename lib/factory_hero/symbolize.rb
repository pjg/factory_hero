module Symbolize

  refine Object do
    def symbolize
      to_s.downcase.to_sym
    end
  end

end
