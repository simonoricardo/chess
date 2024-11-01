export default {
  mounted() {
    const square = document.querySelector(".square");
    let currentWidth = square.getBoundingClientRect().width;

    this.pushEvent("square-size", { square_size: currentWidth });

    window.addEventListener("resize", () => {
      const newWidth = square.getBoundingClientRect().width;

      if (newWidth !== currentWidth) {
        currentWidth = newWidth;
        this.pushEvent("square-size", { square_size: newWidth });
      }
    });
  },
};
