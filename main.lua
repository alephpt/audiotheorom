arenaW = 1000
arenaH = 600
xOff = 120
yOff = 40
cSize = 20

function activate(tone)
    for oct = 1, tone.octaves do
        for st = 1, tone.semitones do
--            if active(tone.active)
--            return true;
        end
    end
end

function stepfn(dt)
    if #Steps == 0 then
        for oct = 1, octaves do
            for st = 1, semitones do
                table.insert(Steps, {
                    y = oct * 40,
                    x = st * 40})
            end
        end
    end
end




function love.load()
    cents = 100
    semitones = 12
    octaves = 12
    activePitch = {} -- contains Notes that are active
    activeGroups = {} -- contains Pitch Groups that active
    activeNotes = {} -- contains Tones that are active

    -- works across octave / pitchclass
    Pitchgroup = ({
        Pitches = {}, -- semitone
        Notes = {}
    })

    Cent = ({
        velocity = 0
    })

    Steps = ({
        x = 0,
        y = 0
    })

    Pitchclass = ({
        Frequency = 0,
        Step = 0,
        Octave = 0
    })

    Tones = ({
        active = 0,
    })
end

    
function love.update(dt)
    -- update if a note is active or not
    stepfn(dt)
end


function love.draw()
    for y = -1, 1 do
       for x = -1, 1 do
            love.graphics.origin()
            love.graphics.translate(x * arenaW, y * arenaH)

            for toneIndex, step in ipairs(Steps) do
                love.graphics.setColor(1, 0.1, 0.2)
                love.graphics.circle('line', step.x + xOff, step.y + yOff, cSize)
            end
            
         end
    end

    love.graphics.origin()
    love.graphics.setColor(1,1,1)
end
