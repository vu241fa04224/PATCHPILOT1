import React from 'react';
import { BrowserRouter, Routes, Route, Navigate, Outlet } from 'react-router-dom';
import { AuthProvider } from './context/AuthContext';
import ProtectedRoute from './components/ProtectedRoute';
import Sidebar from './components/Sidebar';

// Pages
import LoginPage from './pages/LoginPage';
import DashboardPage from './pages/DashboardPage';
import VulnerabilitiesPage from './pages/VulnerabilitiesPage';
import AddVulnerabilityPage from './pages/AddVulnerabilityPage';
import VulnerabilityDetailsPage from './pages/VulnerabilityDetailsPage';
import PrioritizationQueuePage from './pages/PrioritizationQueuePage';
import ComparisonPage from './pages/ComparisonPage';
import AssetsPage from './pages/AssetsPage';
import RemediationPage from './pages/RemediationPage';
import AnalyticsPage from './pages/AnalyticsPage';
import MLInsightsPage from './pages/MLInsightsPage';
import HelpPage from './pages/HelpPage';

function AppLayout() {
  return (
    <div className="flex min-h-screen bg-slate-950 text-slate-100 font-sans">
      <Sidebar />
      <div className="flex-1 flex flex-col min-w-0 overflow-y-auto">
        <Outlet />
      </div>
    </div>
  );
}

export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <Routes>
          {/* Public Route */}
          <Route path="/login" element={<LoginPage />} />

          {/* Protected Application Routes */}
          <Route
            path="/"
            element={
              <ProtectedRoute>
                <AppLayout />
              </ProtectedRoute>
            }
          >
            <Route index element={<Navigate to="/dashboard" replace />} />
            <Route path="dashboard" element={<DashboardPage />} />
            <Route path="vulnerabilities" element={<VulnerabilitiesPage />} />
            <Route path="vulnerabilities/new" element={<AddVulnerabilityPage />} />
            <Route path="vulnerabilities/:id" element={<VulnerabilityDetailsPage />} />
            <Route path="prioritization" element={<PrioritizationQueuePage />} />
            <Route path="comparison" element={<ComparisonPage />} />
            <Route path="assets" element={<AssetsPage />} />
            <Route path="remediation" element={<RemediationPage />} />
            <Route path="analytics" element={<AnalyticsPage />} />
            <Route path="ml-insights" element={<MLInsightsPage />} />
            <Route path="help" element={<HelpPage />} />
          </Route>

          {/* Catch-all route */}
          <Route path="*" element={<Navigate to="/dashboard" replace />} />
        </Routes>
      </AuthProvider>
    </BrowserRouter>
  );
}
