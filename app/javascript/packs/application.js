// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
// require("turbolinks").start()
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("bootstrap/dist/js/bootstrap");
require("@nathanvda/cocoon");
require("@fortawesome/fontawesome-free/js/all");
require("./jquery.ezdz.min");

document.addEventListener('DOMContentLoaded', () => {
  const heicChanger = (target) => {
    target.on('change', e => {
      const blob = e.target.files[0]
      if (blob.extension === "heic") {
        e.target.classList.add('heic-change')
        heic2any({
          blob,
          toType: "image/jpeg",
          quality: 0.5
        }).then(resultBlob => {
          imageUrl = URL.createObjectURL(resultBlob)
          $('.heic-change').ezdz('preview', imageUrl);
          e.target.classList.remove('heic-change')
        });
      }
    })
  }

  $('input[type="file"]').each(function () {
    const imageUrl = $(this).data('image-url')
    $(this).ezdz()
    $(this).ezdz('preview', imageUrl);
  })

  heicChanger($('input[type="file"]'))

  $('#travel-form').on('cocoon:after-insert', function (e, insertedItem, originalEvent) {
    const insertedForm = insertedItem.find('input[type="file"]')
    insertedForm.ezdz();
    heicChanger(insertedForm)
  });
});