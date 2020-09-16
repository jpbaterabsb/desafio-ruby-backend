<template>
  <div id="app">
    <v-app id="inspire">
      <v-app-bar app color="indigo" dark>
        <v-toolbar-title>CNAB PARSER</v-toolbar-title>
        <v-spacer />
        <div>
          <v-btn @click="home()" text>
            Upload Arquivo
          </v-btn>
          <v-btn @click="list()" text>
            Lojas
          </v-btn>
        </div>
      </v-app-bar>
      <v-main>
        <router-view />
      </v-main>
      <v-footer color="indigo" app>
        <span class="white--text">&copy; {{ new Date().getFullYear() }}</span>
      </v-footer>
    </v-app>
  </div>
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
<script>
export default {
  props: {
    source: String,
  },
  data: () => ({
    drawer: null,
  }),
  methods: {
    home() {
      this.$router.push("/");
    },
    list() {
      this.$router.push("/lojas");
    },
  },
};
</script>
