<template>
  <div class="btn-container">
    <label>
    <button :class="['btn', player, intensity]" @click="playSound(path)">
        <img src="../../public/play-circle-regular.svg" class="play_icon"/>
    </button>
    </label>
  </div>
</template>

<script>
export default {
  name: 'Sound',
  props: {
    player: String,
    intensity: String,
    path: String
  },
  methods: {
    init() {
      const audio = new Audio(this.path)
      audio.load()
    },
    playSound (sound) {
      if(sound) {
        const audio = new Audio(this.path)
        var playPromise = audio.play();
        // In browsers that don’t yet support this functionality,
        // playPromise won’t be defined.
        if (playPromise !== undefined) {
          playPromise.then(function() {
            // Automatic playback started!
          }).catch(function(error) {
            console.log(error)
            // Automatic playback failed.
            // Show a UI element to let the user manually start playback.
          });
        }
      }
    }
  },
  mounted() {
    this.init()
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.btn-container {
  padding: 5px;
}

.btn {
  border: none;
  outline: none;
  padding: 0;
  height: 40px;
  width: 40px;
  box-shadow: 0 0 5px rgba(0,0,0,0.15), 0 2px 10px rgba(0,0,0,0.1);
  transition: background-color 150ms;
  border:none;
  text-decoration: none;
  cursor: pointer;
}

.player_1.low_intensity {
  background-color: hsl(169, 72%, 41%);
}
.player_1.low_intensity:hover {
  background-color: hsl(169, 59%, 66%);
}
.player_1.high_intensity {
  background-color: hsl(159, 85%, 29%);
}
.player_1.high_intensity:hover {
  background-color: hsl(159, 37%, 45%);
}

.player_2.low_intensity {
  background-color: hsl(279, 72%, 54%);
}
.player_2.low_intensity:hover {
  background-color: hsl(279, 46%, 61%);
}
.player_2.high_intensity {
  background-color: hsl(262, 83%, 45%);
}
.player_2.high_intensity:hover {
  background-color: hsl(262, 60%, 60%);
}

.container {
  display: flex;
  align-items:center;
  justify-content: center;
}

.play_icon {
  width:60%;
}

</style>
