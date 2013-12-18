$(function() 
{
  $('#s3-uploader').S3Uploader(
  { 
      click_submit_target: $('.submit-target'),
      remove_completed_progress_bar: false,
      progress_bar_target: $('#uploads_container')
  });
  $('#s3-uploader').bind('s3_upload_failed', function(e, content) 
    {
    return alert(content.filename + ' failed to upload');
    });
  $('#s3-uploader').bind("s3_upload_complete", function(e, content) 
  {
    $('#drag-here').hide();
    $('.progress').hide();
    $('form').hide();
    $('#upload-image').append('<img class="upload-image" src="'+content.url+'" />');
  });
});