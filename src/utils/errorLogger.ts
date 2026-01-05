/**
 * Error Logger - Simple error monitoring
 * Production: Use Sentry, LogRocket, or similar
 */

interface ErrorLog {
  timestamp: Date
  level: 'error' | 'warn' | 'info'
  message: string
  stack?: string
  context?: Record<string, unknown>
}

class ErrorLogger {
  private logs: ErrorLog[] = []
  private maxLogs = 1000

  log(level: ErrorLog['level'], message: string, context?: Record<string, unknown>, error?: Error) {
    const logEntry: ErrorLog = {
      timestamp: new Date(),
      level,
      message,
      stack: error?.stack,
      context
    }

    this.logs.push(logEntry)

    // Keep only last maxLogs entries
    if (this.logs.length > this.maxLogs) {
      this.logs = this.logs.slice(-this.maxLogs)
    }

    // Console output with color
    const colors = { error: '\x1b[31m', warn: '\x1b[33m', info: '\x1b[36m' }
    const reset = '\x1b[0m'
    console.log(`${colors[level]}[${level.toUpperCase()}]${reset} ${message}`)

    if (error?.stack) {
      console.log(`  ${error.stack.split('\n').slice(1, 3).join('\n  ')}`)
    }
  }

  error(message: string, context?: Record<string, unknown>, error?: Error) {
    this.log('error', message, context, error)
  }

  warn(message: string, context?: Record<string, unknown>) {
    this.log('warn', message, context)
  }

  info(message: string, context?: Record<string, unknown>) {
    this.log('info', message, context)
  }

  getLogs(level?: ErrorLog['level']): ErrorLog[] {
    if (level) {
      return this.logs.filter(l => l.level === level)
    }
    return [...this.logs]
  }

  getStats() {
    return {
      total: this.logs.length,
      errors: this.logs.filter(l => l.level === 'error').length,
      warnings: this.logs.filter(l => l.level === 'warn').length,
      info: this.logs.filter(l => l.level === 'info').length,
    }
  }

  clear() {
    this.logs = []
  }
}

export const errorLogger = new ErrorLogger()
