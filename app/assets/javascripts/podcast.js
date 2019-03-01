$(function () {
      $('#fileupload').fileupload({
            add: function (e, data) {
              $("#fileupload").remove();
                data.progressBar = $('<div class="progress" style="width: 100%"><div class="progress-bar"></div></div>').insertAfter("input.hidden");
              var options = {
                filename: data.files[0].name.match(/[^\/\\]*$/)[0], // set filename for extension
                _: Date.now(), // prevent caching
              }
              $.getJSON('/presign', options, function (result) {
                data.formData = result['fields'];
                data.url = result['url'];
                data.paramName = 'file';
                data.submit();
              });
              $('#podcastUpload').attr('disabled',true).val("You can complete the form while the file is uploading...");
            },
            progress: function (e, data) {
              var progress = parseInt(data.loaded / data.total * 100, 10);
              var percentage = progress.toString() + '%'
              data.progressBar.find(".progress-bar").css("width", percentage).html(percentage);
            },
            done: function (e, data) {
              //data.progressBar.remove();
              $("div.progress-bar").html('file uploaded successfully');
              $('#podcastUpload').attr('disabled',false).val("Submit Podcast");
              
              var file = {
                id: data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix part
                storage: 'cache',
                metadata: {
                  size: data.files[0].size,
                  filename: data.files[0].name.match(/[^\/\\]*$/)[0], // IE returns full path
                  mime_type: data.files[0].type
                }
              }
              var file_name = "<span>" + data.files[0].name.toString() + "</span>"
              
                $(file_name).insertBefore('input.hidden');

              $('input.hidden').val(JSON.stringify(file));
              }})
            }
            );