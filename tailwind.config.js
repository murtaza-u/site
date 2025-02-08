/** @type {import('tailwindcss').Config} */
export const content = ['./layouts/**/*.html']
export const theme = {
  fontFamily: {
    sans: ['Roboto', 'sans-serif'],
    mono: ['Ubuntu Mono', 'monospace']
  },
  extend: {
    backgroundImage: {
      'diagonal-cut':
        '-webkit-linear-gradient(30deg, var(--tw-gradient-stops));'
    }
  }
}
export const plugins = [require('daisyui')]
export const daisyui = {
  themes: [
    {
      light: {
        ...require('daisyui/src/theming/themes')['light'],
        primary: '#abc3d6',
        secondary: '#1864ab',
        accent: '#0000ff',
        neutral: '#e5e7eb',
        'primary-content': 'white',
        'secondary-content': 'white',
        'success-content': 'white',
        'error-content': 'white',
        '--rounded-btn': '0.5rem',
        '--rounded-box': '0.5rem'
      }
    },
    {
      dark: {
        ...require('daisyui/src/theming/themes')['dark'],
        neutral: 'black',
        accent: '#7c9fc2',
        'base-100': '#232a33',
        'base-300': '#4470ad',
        'base-content': '#f8f8ff',
        '--rounded-btn': '0.5rem',
        '--rounded-box': '0.5rem'
      }
    }
  ]
}
