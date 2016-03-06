// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function () {
  $('.question-class').click(function () {
    var questionID = parseInt($(this).attr('data-qid'));
    $('#attached_question_id').val(questionID);
    $('#new_attached').trigger('submit');
  });

});
