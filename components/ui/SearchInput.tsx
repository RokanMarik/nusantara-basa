"use client";

import { useState, useRef } from "react";

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
    <form onSubmit={handleSubmit} className="relative">
      <svg className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-[#666680]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
      </svg>
      <input
        ref={inputRef}
        type="text"
        className="w-full pl-10 pr-10 py-2 bg-[#0a0a0f] border border-[#2a2a40] rounded-lg text-[#e8e8e0] placeholder-[#666680] text-sm focus:outline-none focus:border-[#4b9cf5] focus:ring-1 focus:ring-[#4b9cf5]/20 transition-colors"
        value={value}
        onChange={(e) => onChange(e.target.value)}
        onKeyDown={handleKeyDown}
        onCompositionStart={() => setIsComposing(true)}
        onCompositionEnd={() => setIsComposing(false)}
        placeholder={placeholder}
      />
      {value && (
        <button
          type="submit"
          className="absolute right-2 top-1/2 -translate-y-1/2 w-6 h-6 flex items-center justify-center rounded-full bg-[#4b9cf5] text-[#0a0a0f] hover:bg-[#3a8ae5] transition-colors disabled:opacity-50"
          disabled={loading || !value.trim()}
        >
          {loading ? (
            <div className="w-3 h-3 border border-[#0a0a0f]/30 border-t-transparent rounded-full animate-spin" />
          ) : (
            <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 7l5 5m0 0l-5 5m5-5H6" /></svg>
          )}
        </button>
      )}
    </form>
  );
}
