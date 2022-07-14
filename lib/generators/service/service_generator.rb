# frozen_string_literal: true

# define rails generator to
#   rails g service my_service
class ServiceGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('templates', __dir__)

  argument :attributes, type: :array, default: [], banner: 'attributes'
  class_option :module, type: :string

  # called method for generator
  def create_service_file
    service_file
    spec_file
  end

  # @return [String]
  def formatted_attributes
    attributes.map { |a| ":#{a.name}" }.join(', ')
  end
  
  # @return [String]
  def error_class_name
    class_name.split("::").last + "Error"
  end
  
  # @return [Object]
  def full_error_class_name
    class_name + "::#{error_class_name}"
  end

  private
    def service_file
      service_dir_path = 'app/services'

      generator_path = service_dir_path + "/#{name}.rb"
      generator_dir_path = service_dir_path + "/#{name.split("/")[0..-2].join("/")}"

      Dir.mkdir(service_dir_path) unless File.exist?(service_dir_path)
      Dir.mkdir(generator_dir_path) unless File.exist?(generator_dir_path)
      template('service_template.erb', generator_path)
    end

    def spec_file
      test_service_dir_path = 'test/services'

      test_generator_path = test_service_dir_path + "/#{name}_test.rb"
      test_generator_dir_path = test_service_dir_path + "/#{name.split("/")[0..-2].join("/")}"

      Dir.mkdir(service_dir_path) unless File.exist?(test_service_dir_path)
      Dir.mkdir(test_generator_dir_path) unless File.exist?(test_generator_dir_path)

      template('test_service_template.erb', test_generator_path)
    end
end
