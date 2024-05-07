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
        'primary-content': 'white',
        secondary: '#1864ab',
        'secondary-content': 'white',
        accent: '#0000ff',
        'success-content': 'white',
        'error-content': 'white',
        '--rounded-btn': '0.5rem',
        '--rounded-box': '0.5rem'
      }
    }
  ]
}
