module CqlQdmPatientApi
  class Generator
    @@ctx = nil

    def self.ctx 
      unless @@ctx
        @@ctx = Sprockets::Environment.new(File.expand_path("../../../", __FILE__))
        @@ctx.append_path "app/assets/javascripts"
        @@ctx.append_path "app/assets/javascripts/datatypes"
      end
      @@ctx
    end

  end
end