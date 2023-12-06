import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],

  // production environment
  preview: {
    host: false, //not ready for the public, haha
    port: 8080
  }
})
