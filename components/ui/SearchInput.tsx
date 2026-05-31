"use client";

import { useState, useRef } from "react";

// SVG Icons
const SearchIcon = () => (
  <svg className="w-4 h-4 text-earth-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
  </svg>
);

const ArrowIcon = () => (
  <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" aria-hidden="true">
    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" />
  </svg>
);

const SpinnerIcon = () => (
  <div className="w-3 h-3 border border-white/30 border-t-transparent rounded-full animate-spin" aria-hidden="true" />
);

interface SearchInputProps {
  value: string;
  onChange: (value: string) => void;
  onSearch: (query: string) => void;
  loading: boolean;
  placeholder?: string;
}

export function SearchInput({ value, onChange, onSearch, loading, placeholder = "Cari bahasa..." }: SearchInputProps) {
  const [isComposing, setIsComposing] = useState(false);
  const inputRef = useRef<HTMLInputElement>(null);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    if (value.trim()) onSearch(value.trim());
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === "Enter" && !isComposing) {
      handleSubmit(e);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="relative" role="search" aria-label="Search languages">
      <div className="absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none">
        <SearchIcon />
      </div>
      <input
        ref={inputRef}
        type="search"
        className="input-field pl-10 pr-10"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        onKeyDown={handleKeyDown}
        onCompositionStart={() => setIsComposing(true)}
        onCompositionEnd={() => setIsComposing(false)}
        placeholder={placeholder}
        aria-label={placeholder}
      />
      {value && (
        <button
          type="submit"
          className="absolute right-2 top-1/2 -translate-y-1/2 w-6 h-6 flex items-center justify-center rounded-full bg-amber-700 text-white hover:bg-amber-800 transition-all duration-200 cursor-pointer disabled:opacity-50 disabled:cursor-not-allowed"
          disabled={loading || !value.trim()}
          aria-label="Submit search"
        >
          {loading ? <SpinnerIcon /> : <ArrowIcon />}
        </button>
      )}
    </form>
  );
}
