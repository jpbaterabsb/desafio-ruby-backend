<template>
  <v-container>
    <v-row justify="center">
      <v-col cols="10">
        <v-card>
          <v-card-title>
            {{ nome }}
            <v-spacer></v-spacer>
          </v-card-title>
          <v-data-table :headers="headers" :items="items"></v-data-table>
        </v-card>
      </v-col>
    </v-row>
    <v-overlay :value="overlay">
      <v-progress-circular indeterminate size="64"></v-progress-circular>
    </v-overlay>
  </v-container>
</template>
<style lang="css" scoped>
.row-pointer >>> tbody tr :hover {
  cursor: pointer;
}
</style>
<script>
import api from "../services/api.js";
import { formatCPF, formatReal } from "../utils/format.js";
export default {
  data: () => {
    return {
      nome: "",
      headers: [
        { text: "*", value: "id" },
        { text: "Data", value: "data" },
        { text: "Valor", value: "valor" },
        { text: "CPF", value: "CPF" },
        { text: "Cartão", value: "cartao" },
        { text: "Tipo Transacao", value: "tipo_transacao.descricao" },
      ],
      items: [],
      overlay: false,
    };
  },
  mounted: async function () {
    this.overlay = true;
    const { data } = await api.get(`/lojas/${this.$route.params.id}/registros`);
    this.nome = data.nome;
    this.items = await Promise.all(
      data.registros.map((d) => {
        let n = d;
        n.valor = formatReal(n.valor);
        n.CPF = formatCPF(n.CPF);
        n.data = new Date(n.data).toLocaleString();

        return n;
      })
    );
    this.overlay = false;
  },
};
</script>
