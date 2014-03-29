class SurveysController < ApplicationController
   def new
      totalQCount= 20
      qCount = 5
      @ids = (1..totalQCount).to_a.sample(qCount)

      @survey = Survey.new
      @ids.each do |id|
         @survey.answers.build(:qid => id)
      #qCount.times { @survey.answers.build(qid)}
      end
   end

   def create
      attrs =  params.require(:survey).permit(:level, :years, answers_attributes: [:qid, :ans])
      @survey = Survey.new(attrs)
      @survey.answers.build(params[:survey][:answers])
      @survey.save
      #render text: params[:survey].inspect
      #answers = params[:survey].select {|key, value| key.to_s.match(/^q\d+/)}
      redirect_to surveys_path
   end

   def index
      @surveys = Survey.all
   end
#     private
#
#     def survey_params
#        params.require(:survey).permit(:level, :years, :answers)
#     end
end