class UploadsController < ApplicationController
  def index
    @upload = Upload.new
  end

  def new
    @upload = Upload.new
  end

  def show
  end

  def create
    
    if @upload.save
        render json: { message: "success", uploadId: @upload.id}, status: 200
    else
        render json: {error: @upload.errors.full_.messages.join(", ")}, status: 400 
      end
  end
  
    def list
      students = []
      Student.all.each do |student|
        new_student = {
          id: student.id, 
          name: student.image_file_name,
          size: student.image_file_size,
          src: student.image(:thumb)
        }
        students.push(new_student)
      end
      render json: {images: students}
    end


private

  def upload_params
    params.require(upload).permit(:image)
  end

end
