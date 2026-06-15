'use client'

import { useState, useEffect } from 'react'
import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

interface Language {
  id: string
  name: string
  isoCode: string | null
  speakerCount: number | null
  vitalityStatus: string
  egidsLevel: string
  provinsi: string
  wilayah: string
}

interface FamilyNode {
  id: string
  name: string
  parent_id: string | null
  level: number
  children?: FamilyNode[]
  languages?: Language[]
  languageCount?: number
}

interface FamilyTreeData {
  success: boolean
  data: FamilyNode[]
  stats: {
    totalFamilies: number
    totalLanguages: number
    rootFamilies: number
    languagesWithFamily: number
    languagesWithoutFamily: number
  }
}

export default function FamilyTreePage() {
  const [treeData, setTreeData] = useState<FamilyTreeData | null>(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)
  const [expandedNodes, setExpandedNodes] = useState<Set<string>>(new Set())
  const [searchTerm, setSearchTerm] = useState('')
  const [selectedFamily, setSelectedFamily] = useState<string | null>(null)

  useEffect(() => {
    fetchFamilyTree()
  }, [])

  async function fetchFamilyTree() {
    try {
      setLoading(true)
      const response = await fetch('/api/family-tree')
      const data = await response.json()
      
      if (data.success) {
        setTreeData(data)
      } else {
        setError(data.error || 'Failed to fetch family tree')
      }
    } catch (err: any) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  function toggleNode(nodeId: string) {
    const newExpanded = new Set(expandedNodes)
    if (newExpanded.has(nodeId)) {
      newExpanded.delete(nodeId)
    } else {
      newExpanded.add(nodeId)
    }
    setExpandedNodes(newExpanded)
  }

  function expandAll() {
    if (!treeData) return
    const allIds = new Set<string>()
    
    function collectIds(nodes: FamilyNode[]) {
      nodes.forEach(node => {
        allIds.add(node.id)
        if (node.children) {
          collectIds(node.children)
        }
      })
    }
    
    collectIds(treeData.data)
    setExpandedNodes(allIds)
  }

  function collapseAll() {
    setExpandedNodes(new Set())
  }

  function filterLanguages(languages: Language[]): Language[] {
    if (!searchTerm) return languages
    
    const term = searchTerm.toLowerCase()
    return languages.filter(lang =>
      lang.name.toLowerCase().includes(term) ||
      lang.isoCode?.toLowerCase().includes(term) ||
      lang.provinsi.toLowerCase().includes(term)
    )
  }

  function getVitalityColor(status: string): string {
    switch (status) {
      case 'Aman':
        return 'bg-green-500'
      case 'Rentan':
        return 'bg-yellow-500'
      case 'Terancam':
        return 'bg-orange-500'
      case 'Kritis':
        return 'bg-red-500'
      default:
        return 'bg-gray-500'
    }
  }

  function renderNode(node: FamilyNode, depth: number = 0): JSX.Element {
    const isExpanded = expandedNodes.has(node.id)
    const hasChildren = node.children && node.children.length > 0
    const hasLanguages = node.languages && node.languages.length > 0
    const filteredLanguages = hasLanguages ? filterLanguages(node.languages!) : []
    const isSelected = selectedFamily === node.id

    return (
      <div key={node.id} className="select-none">
        <div
          className={`flex items-center gap-2 py-2 px-3 rounded hover:bg-gray-100 dark:hover:bg-gray-800 cursor-pointer transition-colors ${
            isSelected ? 'bg-blue-50 dark:bg-blue-950 border-l-4 border-blue-500' : ''
          }`}
          style={{ paddingLeft: `${depth * 20 + 12}px` }}
          onClick={() => {
            toggleNode(node.id)
            setSelectedFamily(node.id)
          }}
        >
          {(hasChildren || hasLanguages) && (
            <span className="text-gray-400">
              {isExpanded ? '▼' : '▶'}
            </span>
          )}
          
          <span className="font-medium flex-1">
            {node.name}
          </span>
          
          <Badge variant="secondary" className="text-xs">
            {node.languageCount || 0} bahasa
          </Badge>
        </div>

        {isExpanded && (
          <div className="animate-in fade-in slide-in-from-top-1 duration-200">
            {/* Render child families */}
            {hasChildren && node.children!.map(child =>
              renderNode(child, depth + 1)
            )}

            {/* Render languages */}
            {hasLanguages && filteredLanguages.length > 0 && (
              <div className="ml-4 mt-2 space-y-1">
                {filteredLanguages.map(lang => (
                  <div
                    key={lang.id}
                    className="flex items-center gap-3 py-2 px-3 rounded bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 hover:border-blue-300 dark:hover:border-blue-700 transition-colors"
                    style={{ marginLeft: `${(depth + 1) * 20}px` }}
                  >
                    <div className={`w-2 h-2 rounded-full ${getVitalityColor(lang.vitalityStatus)}`} />
                    
                    <div className="flex-1 min-w-0">
                      <div className="font-medium text-sm truncate">
                        {lang.name}
                      </div>
                      <div className="text-xs text-gray-500 dark:text-gray-400">
                        {lang.provinsi} • {lang.wilayah}
                      </div>
                    </div>

                    <div className="text-right text-xs space-y-1">
                      {lang.isoCode && (
                        <div className="font-mono text-blue-600 dark:text-blue-400">
                          {lang.isoCode}
                        </div>
                      )}
                      {lang.speakerCount !== null && (
                        <div className="text-gray-600 dark:text-gray-400">
                          {lang.speakerCount.toLocaleString('id-ID')} penutur
                        </div>
                      )}
                      <Badge variant="outline" className="text-xs">
                        {lang.vitalityStatus}
                      </Badge>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}
      </div>
    )
  }

  if (loading) {
    return (
      <div className="container mx-auto py-8">
        <div className="flex items-center justify-center min-h-[400px]">
          <div className="text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4" />
            <p className="text-gray-600 dark:text-gray-400">
              Memuat pohon rumpun bahasa...
            </p>
          </div>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="container mx-auto py-8">
        <Card className="max-w-2xl mx-auto">
          <CardHeader>
            <CardTitle className="text-red-600">Error</CardTitle>
            <CardDescription>{error}</CardDescription>
          </CardHeader>
          <CardContent>
            <Button onClick={fetchFamilyTree}>Coba Lagi</Button>
          </CardContent>
        </Card>
      </div>
    )
  }

  return (
    <div className="container mx-auto py-8 space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-4xl font-bold mb-2">Pohon Rumpun Bahasa</h1>
        <p className="text-gray-600 dark:text-gray-400">
          Visualisasi hierarki rumpun bahasa daerah di Indonesia
        </p>
      </div>

      {/* Statistics Cards */}
      {treeData?.stats && (
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Card>
            <CardHeader className="pb-3">
              <CardDescription>Total Rumpun</CardDescription>
              <CardTitle className="text-3xl">{treeData.stats.totalFamilies}</CardTitle>
            </CardHeader>
          </Card>
          
          <Card>
            <CardHeader className="pb-3">
              <CardDescription>Total Bahasa</CardDescription>
              <CardTitle className="text-3xl">{treeData.stats.totalLanguages}</CardTitle>
            </CardHeader>
          </Card>
          
          <Card>
            <CardHeader className="pb-3">
              <CardDescription>Rumpun Utama</CardDescription>
              <CardTitle className="text-3xl">{treeData.stats.rootFamilies}</CardTitle>
            </CardHeader>
          </Card>
        </div>
      )}

      {/* Controls */}
      <Card>
        <CardContent className="pt-6">
          <div className="flex flex-col sm:flex-row gap-4">
            <div className="flex-1">
              <Label htmlFor="search">Cari Bahasa</Label>
              <Input
                id="search"
                placeholder="Ketik nama bahasa, kode ISO, atau provinsi..."
                value={searchTerm}
                onChange={(e) => setSearchTerm(e.target.value)}
              />
            </div>
            
            <div className="flex gap-2 items-end">
              <Button onClick={expandAll} variant="outline">
                Buka Semua
              </Button>
              <Button onClick={collapseAll} variant="outline">
                Tutup Semua
              </Button>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Family Tree */}
      <Card>
        <CardHeader>
          <CardTitle>Hierarki Rumpun Bahasa</CardTitle>
          <CardDescription>
            Klik pada rumpun bahasa untuk melihat sub-rumpun dan bahasa-bahasa di dalamnya
          </CardDescription>
        </CardHeader>
        <CardContent>
          {treeData && treeData.data.length > 0 ? (
            <div className="space-y-1 max-h-[800px] overflow-y-auto">
              {treeData.data.map(node => renderNode(node))}
            </div>
          ) : (
            <div className="text-center py-12 text-gray-500">
              Tidak ada data rumpun bahasa
            </div>
          )}
        </CardContent>
      </Card>

      {/* Legend */}
      <Card>
        <CardHeader>
          <CardTitle className="text-lg">Keterangan</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-green-500" />
              <span className="text-sm">Aman</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-yellow-500" />
              <span className="text-sm">Rentan</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-orange-500" />
              <span className="text-sm">Terancam</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-red-500" />
              <span className="text-sm">Kritis</span>
            </div>
          </div>
        </CardContent>
      </Card>
    </div>
  )
}
