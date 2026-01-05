#!/usr/bin/env node
/**
 * CLI Interactive - Bonsai Tracker MVP
 * Test du framework en conditions réelles
 */

import * as readline from 'readline'
import { BonsaiService } from '../services/BonsaiService.js'
import type { Bonsai, BonsaiStatus } from '../types/bonsai.js'

// Colors
const c = {
  reset: '\x1b[0m',
  bold: '\x1b[1m',
  dim: '\x1b[2m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  magenta: '\x1b[35m',
  cyan: '\x1b[36m',
  red: '\x1b[31m',
  bgGreen: '\x1b[42m',
  bgBlue: '\x1b[44m'
}

const service = new BonsaiService()

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
})

function prompt(question: string): Promise<string> {
  return new Promise(resolve => {
    rl.question(question, answer => resolve(answer.trim()))
  })
}

function printHeader(): void {
  console.clear()
  console.log(`${c.bgGreen}${c.bold}                                        ${c.reset}`)
  console.log(`${c.bgGreen}${c.bold}   🌳 BONSAI TRACKER - MVP CLI          ${c.reset}`)
  console.log(`${c.bgGreen}${c.bold}   Test Framework Projet Claude Code    ${c.reset}`)
  console.log(`${c.bgGreen}${c.bold}                                        ${c.reset}`)
  console.log()
}

function printMenu(): void {
  console.log(`${c.cyan}${c.bold}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${c.reset}`)
  console.log(`${c.cyan}  MENU PRINCIPAL${c.reset}`)
  console.log(`${c.cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${c.reset}`)
  console.log()
  console.log(`  ${c.green}1${c.reset} - Créer un bonsai`)
  console.log(`  ${c.green}2${c.reset} - Lister tous les bonsais`)
  console.log(`  ${c.green}3${c.reset} - Rechercher par site`)
  console.log(`  ${c.green}4${c.reset} - Voir détails d'un bonsai`)
  console.log(`  ${c.green}5${c.reset} - Modifier un bonsai`)
  console.log(`  ${c.green}6${c.reset} - Transférer vers un site`)
  console.log(`  ${c.green}7${c.reset} - Supprimer un bonsai`)
  console.log(`  ${c.green}8${c.reset} - Statistiques`)
  console.log()
  console.log(`  ${c.dim}0${c.reset} - Quitter`)
  console.log()
}

function formatBonsai(b: Bonsai, short = false): string {
  const statusIcon: Record<BonsaiStatus, string> = {
    healthy: '🟢',
    sick: '🔴',
    treatment: '🟠',
    quarantine: '🟡',
    sold: '⚪'
  }

  if (short) {
    return `${statusIcon[b.status]} ${c.bold}${b.species}${c.reset} (${b.age} ans) - ${c.dim}${b.siteId}${c.reset}`
  }

  return `
${c.cyan}┌─────────────────────────────────────────┐${c.reset}
${c.cyan}│${c.reset} ${statusIcon[b.status]} ${c.bold}${b.species}${c.reset}
${c.cyan}├─────────────────────────────────────────┤${c.reset}
${c.cyan}│${c.reset} ID      : ${c.dim}${b.id}${c.reset}
${c.cyan}│${c.reset} Âge     : ${b.age} ans
${c.cyan}│${c.reset} Site    : ${c.yellow}${b.siteId}${c.reset}
${c.cyan}│${c.reset} Status  : ${b.status}
${c.cyan}│${c.reset} Acquis  : ${b.acquisitionDate.toLocaleDateString('fr-FR')}
${b.metadata.style ? `${c.cyan}│${c.reset} Style   : ${b.metadata.style}` : ''}
${b.metadata.height ? `${c.cyan}│${c.reset} Hauteur : ${b.metadata.height} cm` : ''}
${b.metadata.origin ? `${c.cyan}│${c.reset} Origine : ${b.metadata.origin}` : ''}
${c.cyan}└─────────────────────────────────────────┘${c.reset}`
}

async function createBonsai(): Promise<void> {
  console.log(`\n${c.green}${c.bold}➕ CRÉER UN BONSAI${c.reset}\n`)

  const species = await prompt(`  Espèce ${c.dim}(ex: Ficus retusa)${c.reset}: `)
  if (!species) { console.log(`${c.red}Annulé${c.reset}`); return }

  const ageStr = await prompt(`  Âge ${c.dim}(années)${c.reset}: `)
  const age = parseInt(ageStr, 10)
  if (isNaN(age) || age < 0) { console.log(`${c.red}Âge invalide${c.reset}`); return }

  const siteId = await prompt(`  Site ${c.dim}(ex: pepiniere-nord)${c.reset}: `)
  if (!siteId) { console.log(`${c.red}Annulé${c.reset}`); return }

  const style = await prompt(`  Style ${c.dim}(optionnel: moyogi, chokkan...)${c.reset}: `)
  const origin = await prompt(`  Origine ${c.dim}(optionnel)${c.reset}: `)

  try {
    const bonsai = await service.create({
      species,
      age,
      siteId,
      metadata: {
        ...(style && { style }),
        ...(origin && { origin })
      }
    })

    console.log(`\n${c.green}✅ Bonsai créé avec succès !${c.reset}`)
    console.log(formatBonsai(bonsai))
  } catch (err) {
    console.log(`\n${c.red}❌ Erreur: ${(err as Error).message}${c.reset}`)
  }
}

async function listBonsais(): Promise<void> {
  console.log(`\n${c.blue}${c.bold}📋 LISTE DES BONSAIS${c.reset}\n`)

  const bonsais = await service.findAll()

  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucun bonsai enregistré${c.reset}`)
    console.log(`  ${c.dim}Utilisez l'option 1 pour en créer${c.reset}`)
    return
  }

  console.log(`  ${c.dim}${bonsais.length} bonsai(s) trouvé(s)${c.reset}\n`)

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })
}

async function searchBySite(): Promise<void> {
  console.log(`\n${c.magenta}${c.bold}🔍 RECHERCHER PAR SITE${c.reset}\n`)

  const siteId = await prompt(`  Site à rechercher: `)
  if (!siteId) return

  const bonsais = await service.findAll({ siteId })

  console.log(`\n  ${c.dim}${bonsais.length} bonsai(s) sur ${siteId}${c.reset}\n`)

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })
}

async function viewDetails(): Promise<void> {
  console.log(`\n${c.cyan}${c.bold}👁️ DÉTAILS D'UN BONSAI${c.reset}\n`)

  const bonsais = await service.findAll()
  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucun bonsai enregistré${c.reset}`)
    return
  }

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })

  const choice = await prompt(`\n  Numéro du bonsai: `)
  const index = parseInt(choice, 10) - 1

  if (index >= 0 && index < bonsais.length) {
    console.log(formatBonsai(bonsais[index]))
  } else {
    console.log(`${c.red}Choix invalide${c.reset}`)
  }
}

async function updateBonsai(): Promise<void> {
  console.log(`\n${c.yellow}${c.bold}✏️ MODIFIER UN BONSAI${c.reset}\n`)

  const bonsais = await service.findAll()
  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucun bonsai enregistré${c.reset}`)
    return
  }

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })

  const choice = await prompt(`\n  Numéro du bonsai à modifier: `)
  const index = parseInt(choice, 10) - 1

  if (index < 0 || index >= bonsais.length) {
    console.log(`${c.red}Choix invalide${c.reset}`)
    return
  }

  const bonsai = bonsais[index]
  console.log(`\n  ${c.dim}Laisser vide pour ne pas modifier${c.reset}\n`)

  const status = await prompt(`  Nouveau status ${c.dim}(healthy/sick/treatment/quarantine/sold)${c.reset}: `)
  const ageStr = await prompt(`  Nouvel âge: `)

  try {
    const updated = await service.update(bonsai.id, {
      ...(status && { status: status as BonsaiStatus }),
      ...(ageStr && { age: parseInt(ageStr, 10) })
    })

    console.log(`\n${c.green}✅ Bonsai modifié !${c.reset}`)
    console.log(formatBonsai(updated))
  } catch (err) {
    console.log(`\n${c.red}❌ Erreur: ${(err as Error).message}${c.reset}`)
  }
}

async function transferBonsai(): Promise<void> {
  console.log(`\n${c.magenta}${c.bold}🚚 TRANSFÉRER UN BONSAI${c.reset}\n`)

  const bonsais = await service.findAll()
  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucun bonsai enregistré${c.reset}`)
    return
  }

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })

  const choice = await prompt(`\n  Numéro du bonsai à transférer: `)
  const index = parseInt(choice, 10) - 1

  if (index < 0 || index >= bonsais.length) {
    console.log(`${c.red}Choix invalide${c.reset}`)
    return
  }

  const bonsai = bonsais[index]
  const targetSiteId = await prompt(`  Site de destination: `)

  if (!targetSiteId) {
    console.log(`${c.red}Annulé${c.reset}`)
    return
  }

  try {
    const transferred = await service.transfer(bonsai.id, { targetSiteId })

    console.log(`\n${c.green}✅ Bonsai transféré !${c.reset}`)
    console.log(`  ${c.dim}${bonsai.siteId}${c.reset} → ${c.yellow}${transferred.siteId}${c.reset}`)
    console.log(formatBonsai(transferred))
  } catch (err) {
    console.log(`\n${c.red}❌ Erreur: ${(err as Error).message}${c.reset}`)
  }
}

async function deleteBonsai(): Promise<void> {
  console.log(`\n${c.red}${c.bold}🗑️ SUPPRIMER UN BONSAI${c.reset}\n`)

  const bonsais = await service.findAll()
  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucun bonsai enregistré${c.reset}`)
    return
  }

  bonsais.forEach((b, i) => {
    console.log(`  ${c.dim}${i + 1}.${c.reset} ${formatBonsai(b, true)}`)
  })

  const choice = await prompt(`\n  Numéro du bonsai à supprimer: `)
  const index = parseInt(choice, 10) - 1

  if (index < 0 || index >= bonsais.length) {
    console.log(`${c.red}Choix invalide${c.reset}`)
    return
  }

  const bonsai = bonsais[index]
  const confirm = await prompt(`  ${c.red}Confirmer suppression de ${bonsai.species} ? (o/n)${c.reset}: `)

  if (confirm.toLowerCase() !== 'o') {
    console.log(`${c.dim}Annulé${c.reset}`)
    return
  }

  try {
    await service.delete(bonsai.id)
    console.log(`\n${c.green}✅ Bonsai supprimé${c.reset}`)
  } catch (err) {
    console.log(`\n${c.red}❌ Erreur: ${(err as Error).message}${c.reset}`)
  }
}

async function showStats(): Promise<void> {
  console.log(`\n${c.blue}${c.bold}📊 STATISTIQUES${c.reset}\n`)

  const bonsais = await service.findAll()

  if (bonsais.length === 0) {
    console.log(`  ${c.dim}Aucune donnée${c.reset}`)
    return
  }

  // Par site
  const sites = new Map<string, number>()
  bonsais.forEach(b => {
    sites.set(b.siteId, (sites.get(b.siteId) || 0) + 1)
  })

  // Par status
  const statuses = new Map<string, number>()
  bonsais.forEach(b => {
    statuses.set(b.status, (statuses.get(b.status) || 0) + 1)
  })

  // Âge moyen
  const avgAge = bonsais.reduce((sum, b) => sum + b.age, 0) / bonsais.length

  console.log(`${c.cyan}┌─────────────────────────────────────────┐${c.reset}`)
  console.log(`${c.cyan}│${c.reset} Total bonsais : ${c.bold}${bonsais.length}${c.reset}`)
  console.log(`${c.cyan}│${c.reset} Âge moyen     : ${c.bold}${avgAge.toFixed(1)} ans${c.reset}`)
  console.log(`${c.cyan}├─────────────────────────────────────────┤${c.reset}`)
  console.log(`${c.cyan}│${c.reset} ${c.bold}Par site :${c.reset}`)
  sites.forEach((count, site) => {
    console.log(`${c.cyan}│${c.reset}   ${site}: ${count}`)
  })
  console.log(`${c.cyan}├─────────────────────────────────────────┤${c.reset}`)
  console.log(`${c.cyan}│${c.reset} ${c.bold}Par status :${c.reset}`)
  statuses.forEach((count, status) => {
    const icon = status === 'healthy' ? '🟢' : status === 'sick' ? '🔴' : '🟠'
    console.log(`${c.cyan}│${c.reset}   ${icon} ${status}: ${count}`)
  })
  console.log(`${c.cyan}└─────────────────────────────────────────┘${c.reset}`)
}

async function main(): Promise<void> {
  printHeader()

  // Seed data pour démo
  console.log(`${c.dim}  Chargement données de démo...${c.reset}`)
  await service.create({ species: 'Ficus retusa', age: 8, siteId: 'pepiniere-nord', metadata: { style: 'moyogi', origin: 'Taiwan' } })
  await service.create({ species: 'Pinus thunbergii', age: 25, siteId: 'pepiniere-nord', status: 'treatment', metadata: { style: 'chokkan' } })
  await service.create({ species: 'Juniperus chinensis', age: 15, siteId: 'pepiniere-sud', metadata: { style: 'shakan', height: 45 } })
  await service.create({ species: 'Acer palmatum', age: 12, siteId: 'pepiniere-sud', metadata: { origin: 'Japan' } })
  console.log(`${c.green}  ✓ 4 bonsais chargés${c.reset}\n`)

  let running = true

  while (running) {
    printMenu()
    const choice = await prompt(`${c.bold}  Choix: ${c.reset}`)

    switch (choice) {
      case '1': await createBonsai(); break
      case '2': await listBonsais(); break
      case '3': await searchBySite(); break
      case '4': await viewDetails(); break
      case '5': await updateBonsai(); break
      case '6': await transferBonsai(); break
      case '7': await deleteBonsai(); break
      case '8': await showStats(); break
      case '0':
      case 'q':
      case 'quit':
      case 'exit':
        running = false
        break
      default:
        console.log(`${c.red}  Option invalide${c.reset}`)
    }

    if (running) {
      await prompt(`\n${c.dim}  Appuyez sur Entrée pour continuer...${c.reset}`)
      printHeader()
    }
  }

  console.log(`\n${c.green}  🌳 À bientôt !${c.reset}\n`)
  rl.close()
}

main().catch(console.error)
