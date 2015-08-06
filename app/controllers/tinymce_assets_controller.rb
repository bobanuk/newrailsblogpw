class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    uploaded_io = params[:file]

    require 'digest/md5'
    digest = Digest::MD5.hexdigest(uploaded_io.original_filename)
    Dir.mkdir(Rails.root.join('public', 'uploads', digest))
    filePath = '/uploads/' + digest+ '/' + uploaded_io.original_filename
    File.open(Rails.root.join('public', 'uploads', digest,uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    render json: {
               image: {
                   url: view_context.image_url(filePath)
               }
           }, content_type: "text/html"
  end
end
