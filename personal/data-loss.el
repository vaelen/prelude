(defun data-loss-calculator-full (blockSize blockCount finalBlockSize seconds sampleRate bytesPerSample decimation)
  "This function calculates data loss from a pass."
  (interactive "nBlock size: 
nBlock count: 
nFinal block size: 
nSeconds: 
nSample rate in hz: 
nBytes per sample: 
nDecimation: ")
  (let* ((bytesPerSecond
          (/ (* sampleRate bytesPerSample) decimation))
         (estimatedSize
          (* bytesPerSecond seconds))
         (actualSize
          (+ (* blockSize blockCount) finalBlockSize))
         (delta
          (- estimatedSize actualSize))
         (secondsLost
          (/ (float delta) (float bytesPerSecond)))
         (percentLost
          (* (- (/ (float estimatedSize) (float actualSize)) 1.0 ) 100.0 )))
    (list delta secondsLost percentLost)))

(defun data-loss-calculator (blockCount finalBlockSize seconds)
  "This function calculates data loss from a pass using the default settings for the AR2300 and no decimation."
  (interactive "nNumber of full blocks: 
nFinal block size: 
nSeconds: ")
  (apply 'message (append '("Bytes lost: %d, Seconds lost: %f, Data lost: %f%%")
           (data-loss-calculator-full (* 10 1024 1024) blockCount finalBlockSize seconds 1125000 8 1))))

;; (data-loss-calculator-full (* 10 1024 1024) 513 8912384 600 1125000 8 1)
;; (data-loss-calculator 514 8912384 600)
