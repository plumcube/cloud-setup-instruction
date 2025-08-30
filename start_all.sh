#!/bin/bash

cd /home/ubuntu/playground

echo "🚀 Starting all playground applications..."

# Start Excalidraw
echo "📝 Starting Excalidraw on port 3000..."
cd excalidraw && nohup npm start > excalidraw.log 2>&1 & 
EXCALIDRAW_PID=$!
cd ..

# Start Draw.io
echo "📊 Starting Draw.io on port 4430..."
cd drawio && nohup npm start > drawio.log 2>&1 &
DRAWIO_PID=$!
cd ..

# Start Jupyter
echo "📓 Starting Jupyter on port 8888..."
cd jupyter && source ../../jupyter-env/bin/activate && nohup jupyter-notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root > jupyter.log 2>&1 &
JUPYTER_PID=$!
cd ..

echo ""
echo "✅ All applications started successfully!"
echo ""
echo "📋 Process IDs:"
echo "   Excalidraw: $EXCALIDRAW_PID"
echo "   Draw.io: $DRAWIO_PID" 
echo "   Jupyter: $JUPYTER_PID"

echo ""
echo "🌐 Access URLs:"
echo "   📝 Excalidraw: https://excalidraw.plumcube.com"
echo "   📊 Draw.io: https://drawio.plumcube.com"
echo "   📓 Jupyter: https://jupyter.plumcube.com"

echo ""
echo "📊 Checking status in 5 seconds..."
sleep 5

echo ""
echo "🔍 Port Status:"
ss -tlnp | grep -E "(3000|4430|8888)" || echo "   ⚠️  Some applications may still be starting..."

echo ""
echo "💡 To check logs:"
echo "   tail -f excalidraw/excalidraw.log"
echo "   tail -f drawio/drawio.log" 
echo "   tail -f jupyter/jupyter.log"
