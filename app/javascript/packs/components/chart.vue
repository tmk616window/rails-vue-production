<script>
import { Radar	} from 'vue-chartjs';



export default {
  extends: Radar,
  name: 'chart',
  data () {
    return {
      data: {
        labels: ['インフラ', 'フロントエンド', 'バックエンド', '企画力', 'ユーザビリティ', '独自性'],
        datasets: [
          {
            label: 'ポートフォリオ',
            data: [0,1, 2, 3, 4, 5],
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
      options: {
        scales: {
          ticks: {
            // label: false,
            min: 0,
            max: 5,
            StepSize: 5,
            showLabelBackdrop: false,
            fontSize: 0,
            color: '#eee',
          }
        }
      },

    }
  },
  mounted () {
    this.renderChart(this.data, this.options)
  }
}
</script>
