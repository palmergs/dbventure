import consumer from "channels/consumer"

consumer.subscriptions.create("StagesChannel", {
  connected() {
    console.log("stages channel connected...");
  },

  disconnected() {
    console.log("stages channel disconnected.");
  },

  received(data) {
    console.log("stages channel data:", data);
  }
});
