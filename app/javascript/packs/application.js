require("@rails/ujs").start();
// require("turbolinks").start()
require("@rails/activestorage").start();
require("channels");

require("bootstrap/dist/js/bootstrap");
require("@nathanvda/cocoon");
require("@fortawesome/fontawesome-free/js/all");
require("./jquery.ezdz.min");
require("slick-carousel/slick/slick.min");

document.addEventListener("DOMContentLoaded", () => {
  const heicChanger = (target) => {
    target.on("change", (e) => {
      const blob = e.target.files[0];
      if (blob.extension === "heic") {
        e.target.classList.add("heic-change");
        heic2any({
          blob,
          toType: "image/jpeg",
          quality: 0.5,
        }).then((resultBlob) => {
          imageUrl = URL.createObjectURL(resultBlob);
          $(".heic-change").ezdz("preview", imageUrl);
          e.target.classList.remove("heic-change");
        });
      }
    });
  };

  $('input[type="file"]').each(function () {
    const imageUrl = $(this).data("image-url");
    $(this).ezdz();
    $(this).ezdz("preview", imageUrl);
  });

  heicChanger($('input[type="file"]'));

  $("#travel-form").on("cocoon:after-insert", function (
    e,
    insertedItem,
    originalEvent
  ) {
    const insertedForm = insertedItem.find('input[type="file"]');
    insertedForm.ezdz();
    heicChanger(insertedForm);
  });

  $(".slider").slick({
    dots: true,
    infinite: true,
    speed: 1500,
    fade: true,
    autoplay: true,
    autoplaySpeed: 4000,
    prevArrow: "",
    nextArrow: "",
    dotsClass: "slide-dots",
    pauseOnFocus: false,
    pauseOnHover: false,
    pauseOnDotsHover: false,
  });
});
