import { useState } from 'react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'

interface Endpoint {
  method: 'GET' | 'POST'
  path: string
  description: string
  parameters?: {
    name: string
    in: 'query' | 'body' | 'path'
    required: boolean
    type: string
    description: string
  }[]
  requestBody?: any
  responses: {
    status: number
    description: string
    schema?: any
  }[]
}

const endpoints: Endpoint[] = [
  {
    method: 'GET',
    path: '/api/bahasa',
    description: 'Fetch all languages with optional filters',
    parameters: [
      { name: 'limit', in: 'query', required: false, type: 'number', description: 'Number of results to return (default: 50)' },
      { name: 'offset', in: 'query', required: false, type: 'number', description: 'Number of results to skip (default: 0)' },
      { name: 'search', in: 'query', required: false, type: 'string', description: 'Search by language name, ISO code, or province' },
      { name: 'vitality', in: 'query', required: false, type: 'string', description: 'Filter by vitality status (Aman, Rentan, Terancam, Kritis)' },
      { name: 'family', in: 'query', required: false, type: 'string', description: 'Filter by language family ID' }
    ],
    responses: [
      {
        status: 200,
        description: 'List of languages',
        schema: {
          success: true,
          data: [
            {
              id: 'string',
              nama: 'string',
              isoCode: 'string | null',
              speakerCount: 'number | null',
              vitalityStatus: 'string',
              egidsLevel: 'string',
              provinsi: 'string',
              wilayah: 'string',
              familyName: 'string | null'
            }
          ],
          total: 'number'
        }
      }
    ]
  },
  {
    method: 'GET',
    path: '/api/bahasa/[id]',
    description: 'Fetch a single language by ID',
    parameters: [
      { name: 'id', in: 'path', required: true, type: 'string', description: 'Language ID (UUID)' }
    ],
    responses: [
      {
        status: 200,
        description: 'Language details',
        schema: {
          success: true,
          data: {
            id: 'string',
            nama: 'string',
            nama_lokal: 'string | null',
            isoCode: 'string | null',
            speakerCount: 'number | null',
            vitalityStatus: 'string',
            egidsLevel: 'string',
            provinsi: 'string',
            wilayah: 'string',
            keluargaBahasa: 'string | null',
            catatan: 'string | null'
          }
        }
      },
      { status: 404, description: 'Language not found' }
    ]
  },
  {
    method: 'GET',
    path: '/api/stats',
    description: 'Get aggregated statistics about languages',
    responses: [
      {
        status: 200,
        description: 'Statistics data',
        schema: {
          success: true,
          data: {
            totalLanguages: 'number',
            totalSpeakers: 'number',
            vitalityDistribution: [
              { status: 'string', count: 'number', percentage: 'number' }
            ],
            languageFamilies: 'number',
            provinces: 'number',
            topLanguages: [
              { name: 'string', speakers: 'number' }
            ]
          }
        }
      }
    ]
  },
  {
    method: 'GET',
    path: '/api/geo',
    description: 'Get geographic data for map visualization',
    parameters: [
      { name: 'vitality', in: 'query', required: false, type: 'string', description: 'Filter by vitality status' },
      { name: 'minSpeakers', in: 'query', required: false, type: 'number', description: 'Minimum speaker count' }
    ],
    responses: [
      {
        status: 200,
        description: 'Geographic points',
        schema: {
          success: true,
          data: [
            {
              id: 'string',
              nama: 'string',
              latitude: 'number',
              longitude: 'number',
              vitalityStatus: 'string',
              speakerCount: 'number | null'
            }
          ]
        }
      }
    ]
  },
  {
    method: 'GET',
    path: '/api/export',
    description: 'Export language data in JSON or CSV format',
    parameters: [
      { name: 'format', in: 'query', required: false, type: 'string', description: 'Export format: json (default) or csv' },
      { name: 'fields', in: 'query', required: false, type: 'string', description: 'Comma-separated list of fields to include' },
      { name: 'vitality', in: 'query', required: false, type: 'string', description: 'Filter by vitality status' },
      { name: 'province', in: 'query', required: false, type: 'string', description: 'Filter by province' },
      { name: 'minSpeakers', in: 'query', required: false, type: 'number', description: 'Minimum speaker count' },
      { name: 'maxSpeakers', in: 'query', required: false, type: 'number', description: 'Maximum speaker count' }
    ],
    responses: [
      { status: 200, description: 'Exported data (JSON array or CSV file)' }
    ]
  },
  {
    method: 'POST',
    path: '/api/comparison',
    description: 'Compare 2-4 languages side-by-side',
    requestBody: {
      languageIds: ['string[]']
    },
    responses: [
      {
        status: 200,
        description: 'Comparison results',
        schema: {
          languages: [
            {
              id: 'string',
              nama: 'string',
              isoCode: 'string | null',
              speakerCount: 'number | null',
              vitalityStatus: 'string',
              egidsLevel: 'string',
              provinsi: 'string',
              wilayah: 'string',
              familyName: 'string | null'
            }
          ],
          metrics: {
            speakers: [
              { id: 'string', nama: 'string', count: 'number' }
            ],
            vitality: [
              { id: 'string', nama: 'string', status: 'string', egids: 'string' }
            ],
            geography: [
              { id: 'string', nama: 'string', provinsi: 'string', wilayah: 'string' }
            ],
            proximity: 'Record<string, Record<string, number>>',
            languageFamily: [
              { id: 'string', nama: 'string', family: 'string' }
            ]
          },
          insights: ['string[]']
        }
      },
      { status: 400, description: 'Invalid input (less than 2 or more than 4 languages)' }
    ]
  },
  {
    method: 'GET',
    path: '/api/family-tree',
    description: 'Get hierarchical language family tree',
    responses: [
      {
        status: 200,
        description: 'Family tree structure',
        schema: {
          success: true,
          data: [
            {
              id: 'string',
              name: 'string',
              parent_id: 'string | null',
              level: 'number',
              children: ['FamilyNode[]'],
              languages: ['Language[]'],
              languageCount: 'number'
            }
          ],
          stats: {
            totalFamilies: 'number',
            totalLanguages: 'number',
            rootFamilies: 'number',
            languagesWithFamily: 'number',
            languagesWithoutFamily: 'number'
          }
        }
      }
    ]
  },
  {
    method: 'GET',
    path: '/api/validate',
    description: 'Run data validation checks',
    responses: [
      {
        status: 200,
        description: 'Validation results',
        schema: {
          success: true,
          data: {
            score: 'number',
            checks: [
              {
                name: 'string',
                status: 'string',
                severity: 'string',
                message: 'string'
              }
            ]
          }
        }
      }
    ]
  }
]

export default function APIDocsPage() {
  const [expandedEndpoint, setExpandedEndpoint] = useState<string | null>(null)
  const [testEndpoint, setTestEndpoint] = useState<string | null>(null)
  const [testParams, setTestParams] = useState<Record<string, string>>({})
  const [testResult, setTestResult] = useState<any>(null)
  const [loading, setLoading] = useState(false)

  async function runTest(endpoint: Endpoint) {
    setLoading(true)
    try {
      const url = new URL(endpoint.path, window.location.origin)
      
      if (endpoint.method === 'GET' && endpoint.parameters) {
        endpoint.parameters.forEach(param => {
          if (param.in === 'query' && testParams[param.name]) {
            url.searchParams.append(param.name, testParams[param.name])
          }
        })
      }

      const options: RequestInit = {
        method: endpoint.method,
        headers: { 'Content-Type': 'application/json' }
      }

      if (endpoint.method === 'POST' && endpoint.requestBody) {
        options.body = JSON.stringify(endpoint.requestBody)
      }

      const response = await fetch(url.toString(), options)
      const data = await response.json()
      
      setTestResult({
        status: response.status,
        data
      })
    } catch (error: any) {
      setTestResult({
        status: 500,
        error: error.message
      })
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="container mx-auto py-8 space-y-6">
      <div>
        <h1 className="text-4xl font-bold mb-2">API Documentation</h1>
        <p className="text-gray-600 dark:text-gray-400">
          Complete reference for Nusantara Basa API endpoints
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Base URL</CardTitle>
          <CardDescription>
            All API endpoints are relative to the base URL
          </CardDescription>
        </CardHeader>
        <CardContent>
          <code className="text-sm bg-gray-100 dark:bg-gray-800 px-3 py-2 rounded">
            {typeof window !== 'undefined' ? window.location.origin : 'http://localhost:3000'}
          </code>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Endpoints</CardTitle>
          <CardDescription>
            Click on an endpoint to view details and test it
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-4">
          {endpoints.map((endpoint, idx) => {
            const endpointKey = `${endpoint.method}-${endpoint.path}`
            const isExpanded = expandedEndpoint === endpointKey
            
            return (
              <div key={idx} className="border rounded-lg overflow-hidden">
                <div
                  className="flex items-center gap-3 p-4 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-900 transition-colors"
                  onClick={() => setExpandedEndpoint(isExpanded ? null : endpointKey)}
                >
                  <Badge
                    variant={endpoint.method === 'GET' ? 'default' : 'secondary'}
                    className="font-mono"
                  >
                    {endpoint.method}
                  </Badge>
                  
                  <code className="font-mono text-sm flex-1">
                    {endpoint.path}
                  </code>
                  
                  <span className="text-sm text-gray-600 dark:text-gray-400">
                    {endpoint.description}
                  </span>
                  
                  <span className="text-gray-400">
                    {isExpanded ? '▼' : '▶'}
                  </span>
                </div>

                {isExpanded && (
                  <div className="border-t p-4 bg-gray-50 dark:bg-gray-900 space-y-4">
                    {/* Parameters */}
                    {endpoint.parameters && endpoint.parameters.length > 0 && (
                      <div>
                        <h3 className="font-semibold mb-2">Parameters</h3>
                        <div className="space-y-2">
                          {endpoint.parameters.map((param, pidx) => (
                            <div key={pidx} className="flex items-start gap-3 text-sm">
                              <Badge variant="outline" className="font-mono">
                                {param.name}
                              </Badge>
                              <div className="flex-1">
                                <div className="text-gray-600 dark:text-gray-400">
                                  {param.description}
                                </div>
                                <div className="text-xs text-gray-500 mt-1">
                                  Type: {param.type} • {param.in} •{' '}
                                  {param.required ? 'Required' : 'Optional'}
                                </div>
                              </div>
                            </div>
                          ))}
                        </div>
                      </div>
                    )}

                    {/* Request Body */}
                    {endpoint.requestBody && (
                      <div>
                        <h3 className="font-semibold mb-2">Request Body</h3>
                        <pre className="text-sm bg-white dark:bg-gray-800 p-3 rounded overflow-x-auto">
                          {JSON.stringify(endpoint.requestBody, null, 2)}
                        </pre>
                      </div>
                    )}

                    {/* Responses */}
                    <div>
                      <h3 className="font-semibold mb-2">Responses</h3>
                      <div className="space-y-3">
                        {endpoint.responses.map((response, ridx) => (
                          <div key={ridx} className="border rounded p-3">
                            <div className="flex items-center gap-2 mb-2">
                              <Badge variant={response.status === 200 ? 'default' : 'destructive'}>
                                {response.status}
                              </Badge>
                              <span className="text-sm">{response.description}</span>
                            </div>
                            {response.schema && (
                              <pre className="text-xs bg-white dark:bg-gray-800 p-2 rounded overflow-x-auto">
                                {JSON.stringify(response.schema, null, 2)}
                              </pre>
                            )}
                          </div>
                        ))}
                      </div>
                    </div>

                    {/* Test Endpoint */}
                    <div className="border-t pt-4">
                      <h3 className="font-semibold mb-2">Test Endpoint</h3>
                      
                      {endpoint.parameters && endpoint.parameters.filter(p => p.in === 'query').length > 0 && (
                        <div className="space-y-2 mb-3">
                          {endpoint.parameters
                            .filter(p => p.in === 'query')
                            .map((param, pidx) => (
                              <div key={pidx} className="flex items-center gap-2">
                                <Label htmlFor={param.name} className="w-32 font-mono text-sm">
                                  {param.name}
                                </Label>
                                <Input
                                  id={param.name}
                                  placeholder={param.type}
                                  value={testParams[param.name] || ''}
                                  onChange={(e) => setTestParams({
                                    ...testParams,
                                    [param.name]: e.target.value
                                  })}
                                />
                              </div>
                            ))}
                        </div>
                      )}

                      <Button
                        onClick={() => runTest(endpoint)}
                        disabled={loading}
                        className="w-full"
                      >
                        {loading ? 'Testing...' : 'Send Request'}
                      </Button>

                      {testResult && (
                        <div className="mt-3 space-y-2">
                          <Badge variant={testResult.status === 200 ? 'default' : 'destructive'}>
                            Status: {testResult.status}
                          </Badge>
                          <pre className="text-xs bg-white dark:bg-gray-800 p-3 rounded overflow-x-auto max-h-96">
                            {JSON.stringify(testResult.data || testResult.error, null, 2)}
                          </pre>
                        </div>
                      )}
                    </div>
                  </div>
                )}
              </div>
            )
          })}
        </CardContent>
      </Card>
    </div>
  )
}
