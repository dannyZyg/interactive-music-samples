<template>
  <div class="sample-grid">
    <h3>{{ msg }}</h3>
    <li v-for="(part, index) in parts" :key="part.path" >
      <div v-if="index % 2 == 0" class="sample-description player-id">
        <strong>{{ part.player.replace('_', ' ').toUpperCase() }} </strong>
      </div>
      <div class="sample-description">
        {{ part.intensity.replace('_intensity', '').toUpperCase() }}
      </div>
      <div class="player-flex" >
        <Sound v-for="file in part.files"
          :key="file" :player="part.player"
          :intensity="part.intensity"
          :path="file">
        </Sound>
      </div>
    </li>
  </div>
</template>

<script>
import Sound from './Sound.vue'

export default {
  data: function() {
    return { parts:
      [
        { player: 'player_1',
          intensity: 'low_intensity',
          path: 'p1_C_L',
          files: []
        },
        { player: 'player_1',
          intensity: 'high_intensity',
          path: 'p1_C_H',
          files: []
        },
        { player: 'player_2',
          intensity: 'low_intensity',
          path: 'p2_C_L',
          files: []
        },
        { player: 'player_2',
          intensity: 'high_intensity',
          path: 'p2_C_H',
          files: []
        }
      ]
    }
  },
  name: 'Player',
  components: {
    Sound
  },
  props: {
    msg: String
  },
  created() {
    this.fetchAudioFiles('p1_C_L')
  },
  methods: {
    fetchAudioFiles() {
      const audioFiles = require.context(
        '../../public',
        true,
        /^.*\.mp3/
      )
      const all = audioFiles.keys()
      for (let i = 0; i < this.parts.length; i ++) {
        this.parts[i].files = all.filter(f => f.includes(this.parts[i].path))
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
  padding-bottom: 5px;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  padding-bottom: 10px;
}
a {
}

.player-flex {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.sample-grid {
  background-color: hsl(231, 23%, 74%);
  border: solid 2px black;
  border-radius: 20px;
  width: 220px;
  margin: auto;
}

.sample-description {
  font-size: 10px;
}

.sample-description.player-id {
  position: relative;
  font-size: 10px;
  left: 30px;
}
</style>
