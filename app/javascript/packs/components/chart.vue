<script>
import { Radar	} from 'vue-chartjs';
export default {
  extends: Radar,
  name: 'chart',
  props: ["front_point","backend_point","infra_point","plan_point","user_point","unique_point"],
  data () {
    return {
      data: {
        labels: ['インフラ', 'フロントエンド', 'バックエンド', '企画力', 'ユーザビリティ', '独自性'],
        datasets: [
          {
            label: 'ポートフォリオ',
            data: [this.infra_point,this.front_point, this.backend_point, this.plan_point, this.user_point, this.unique_point],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
            ],
            borderWidth: 0.5
          },
        ]
      },
      chartOption: {
        scale: {
          ticks: {
            label: false,
            min: 0,
            max: 5,
            fixedStepSize: 2,
            showLabelBackdrop: true,
            fontSize: 10,
            color: '#eee',
          }
        },
      },
    }
  },
  mounted () {
    this.renderChart(this.data, this.chartOption)
  }
}
</script>
