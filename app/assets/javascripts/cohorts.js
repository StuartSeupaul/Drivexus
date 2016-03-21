// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load', function () {
  // when a student is clicked, the cohort id is fed into the hidden form
  // for the student and the cohort_id gets updated, then the student disappears
  // from the main list and gets put into the cohort list 
  $('.new-student-list').click(function (){
    cohort_id = parseInt($('#cohort-id').html());
    console.log($(this).children().find('.cohort-add').val(cohort_id));
    $('.hidden_cohort_user_update').trigger('submit');
    $(this).toggleClass('is-added-cohort');
  });

});
