-- Renders fenced code blocks as lstlisting environments, so that the
-- kdp-style listings style from src/preamble.tex is applied to them.
--
--   ```cpp    -> C++ (the style's default, with the extra EasyMT keywords)
--   ```java   -> Java
--   ```<else> -> no language

function CodeBlock(block)
  if not FORMAT:match('latex') then
    return nil
  end

  local class = block.classes[1]
  local options = ''
  if class == 'java' then
    options = '[language=Java]'
  elseif class ~= 'cpp' then
    options = '[language={}]'
  end

  return pandoc.RawBlock('latex',
    '\\begin{lstlisting}' .. options .. '\n' .. block.text .. '\n\\end{lstlisting}')
end
