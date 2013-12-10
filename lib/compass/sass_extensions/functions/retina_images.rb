module Compass::SassExtensions::Functions::RetinaImages
  def file_exists(filename)
    filename = filename.value
    filename = File.join(Compass.configuration.images_path ? Compass.configuration.images_path : Compass.configuration.project_path, filename)
    exists = File.exists?(filename)
    puts("Warning Retina file does not exist: #{filename}") unless exists
    Sass::Script::Bool.new(exists)
  end

  def retina_filename(filename)
    filename = filename.value
    Sass::Script::String.new filename.gsub('x1', 'x2')
  end
end

module Sass::Script::Functions
  include Compass::SassExtensions::Functions::RetinaImages
end
