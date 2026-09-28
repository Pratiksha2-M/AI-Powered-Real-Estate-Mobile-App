import React, { useState } from 'react';
import { X, Send, Bot, Mic, Sparkles, User, CheckCircle2 } from 'lucide-react';

export default function AIAssistantChat({ onClose, activeProperty }) {
  const [messages, setMessages] = useState([
    {
      sender: 'ai',
      text: activeProperty
        ? `Hello! I am your AI Property Assistant. I have loaded context for "${activeProperty.title}". Ask me about maintenance fees, construction quality, Vastu orientation, or local amenities!`
        : `Hello! I am your AI Real Estate Assistant. Ask me anything about home valuation, budget planning, or neighborhood trends!`
    }
  ]);
  const [input, setInput] = useState('');
  const [isRecording, setIsRecording] = useState(false);

  const handleSend = () => {
    if (!input.trim()) return;
    const userMsg = input;
    setInput('');
    setMessages((prev) => [...prev, { sender: 'user', text: userMsg }]);

    // Simulated AI response
    setTimeout(() => {
      let reply = `Based on market analytics and structural context, this property offers strong value. Is there any specific detail like legal checks or Vastu compliance you'd like me to analyze?`;
      if (userMsg.toLowerCase().includes('vastu')) {
        reply = `Vastu Analysis: This unit features North-East entry with kitchen placed in South-East (Agneya corner), receiving an AI Vastu Score of 9.2/10!`;
      } else if (userMsg.toLowerCase().includes('maintenance') || userMsg.toLowerCase().includes('fee')) {
        reply = `Estimated monthly maintenance is ₹3.50/sqft (~₹6,475/month), which covers 24/7 security, rooftop pool, and solar power backup.`;
      }
      setMessages((prev) => [...prev, { sender: 'ai', text: reply }]);
    }, 600);
  };

  const handleVoiceSim = () => {
    setIsRecording(true);
    setTimeout(() => {
      setIsRecording(false);
      setInput('Is this property Vastu compliant and what are the maintenance fees?');
    }, 2000);
  };

  return (
    <div className="fixed bottom-4 right-4 z-50 w-full max-w-sm glass-card rounded-2xl border border-indigo-500/40 shadow-2xl overflow-hidden flex flex-col h-[480px]">
      {/* Header */}
      <div className="bg-indigo-950/80 p-3.5 border-b border-indigo-500/30 flex items-center justify-between">
        <div className="flex items-center gap-2">
          <div className="w-8 h-8 rounded-lg bg-indigo-600 text-white flex items-center justify-center">
            <Bot className="w-4 h-4" />
          </div>
          <div>
            <h3 className="font-bold text-white text-sm">AI Real Estate Copilot</h3>
            <span className="text-[10px] text-emerald-400 font-semibold flex items-center gap-1">
              <span className="w-1.5 h-1.5 rounded-full bg-emerald-400 animate-pulse" /> Active Context Loaded
            </span>
          </div>
        </div>
        <button onClick={onClose} className="text-slate-400 hover:text-white p-1">
          <X className="w-4 h-4" />
        </button>
      </div>

      {/* Message List */}
      <div className="flex-1 p-3 overflow-y-auto space-y-3 bg-slate-950/70 text-xs">
        {messages.map((m, idx) => (
          <div
            key={idx}
            className={`flex items-start gap-2 ${m.sender === 'user' ? 'flex-row-reverse' : ''}`}
          >
            <div
              className={`w-6 h-6 rounded-full flex items-center justify-center text-[10px] ${
                m.sender === 'user' ? 'bg-violet-600 text-white' : 'bg-indigo-600 text-white'
              }`}
            >
              {m.sender === 'user' ? <User className="w-3 h-3" /> : <Bot className="w-3 h-3" />}
            </div>
            <div
              className={`max-w-[80%] p-2.5 rounded-xl ${
                m.sender === 'user'
                  ? 'bg-indigo-600 text-white rounded-tr-none'
                  : 'bg-slate-900 border border-slate-800 text-slate-200 rounded-tl-none'
              }`}
            >
              {m.text}
            </div>
          </div>
        ))}

        {isRecording && (
          <div className="flex items-center gap-2 text-indigo-400 font-semibold animate-pulse text-[11px] p-2 bg-indigo-950/40 rounded-lg">
            <Mic className="w-4 h-4" /> Listening to voice prompt...
          </div>
        )}
      </div>

      {/* Input Form */}
      <div className="p-2.5 bg-slate-900 border-t border-slate-800 flex items-center gap-2">
        <button
          onClick={handleVoiceSim}
          className={`p-2 rounded-xl transition-all ${
            isRecording ? 'bg-red-600 text-white animate-bounce' : 'bg-slate-800 text-slate-400 hover:text-white'
          }`}
          title="Voice Search Simulator"
        >
          <Mic className="w-4 h-4" />
        </button>
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && handleSend()}
          placeholder="Ask AI about this property..."
          className="flex-1 bg-slate-950 border border-slate-800 rounded-xl px-3 py-2 text-xs text-white focus:outline-none focus:border-indigo-500"
        />
        <button
          onClick={handleSend}
          className="p-2 rounded-xl bg-indigo-600 hover:bg-indigo-500 text-white transition-all shadow-md"
        >
          <Send className="w-4 h-4" />
        </button>
      </div>
    </div>
  );
}
