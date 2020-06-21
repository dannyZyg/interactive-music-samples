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
          :path="'./' + part.path + '/' + file">
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
          files: [
            "A_p1_C_L_1.mp3",
            "A_p1_C_L_2.mp3",
            "A_p1_C_L_3.mp3",
            "A_p1_C_L_4.mp3",
            "A_p1_C_L_5.mp3",
            "A_p1_C_L_6.mp3",
            "A_p1_C_L_7.mp3",
            "A_p1_C_L_8.mp3",
            "A_p1_C_L_9.mp3",
            "A_p1_C_L_10.mp3"
          ]
        },
        { player: 'player_1',
          intensity: 'high_intensity',
          path: 'p1_C_H',
          files: [
            "A_p1_C_H_1.mp3",
            "A_p1_C_H_2.mp3",
            "A_p1_C_H_3.mp3",
            "A_p1_C_H_4.mp3",
            "A_p1_C_H_5.mp3",
            "A_p1_C_H_6.mp3",
            "A_p1_C_H_7.mp3",
            "A_p1_C_H_8.mp3",
            "A_p1_C_H_9.mp3",
            "A_p1_C_H_10.mp3"
          ]
        },
        { player: 'player_2',
          intensity: 'low_intensity',
          path: 'p2_C_L',
          files: [
            "A_p2_C_L_1.mp3",
            "A_p2_C_L_2.mp3",
            "A_p2_C_L_3.mp3",
            "A_p2_C_L_4.mp3",
            "A_p2_C_L_5.mp3",
            "A_p2_C_L_6.mp3",
            "A_p2_C_L_7.mp3",
            "A_p2_C_L_8.mp3",
            "A_p2_C_L_9.mp3",
            "A_p2_C_L_10.mp3"
          ]
        },
        { player: 'player_2',
          intensity: 'high_intensity',
          path: 'p2_C_H',
          files: [
            "A_p2_C_H_1.mp3",
            "A_p2_C_H_2.mp3",
            "A_p2_C_H_3.mp3",
            "A_p2_C_H_4.mp3",
            "A_p2_C_H_5.mp3",
            "A_p2_C_H_6.mp3",
            "A_p2_C_H_7.mp3",
            "A_p2_C_H_8.mp3",
            "A_p2_C_H_9.mp3",
            "A_p2_C_H_10.mp3"
          ]
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
