use Mix.Config

config :swarm,
  node_whitelist: [~r/^ac[\d]@.*$/]
                
config :logger,
  backends: [{LoggerFileBackend, :server_log}]

config :logger, :server_log,
  path: "#{Path.absname(__DIR__)}/../tracking.log",
  level: :debug,
  format: "$date $time [$level] $metadata$message\n"

config :libcluster,
  topologies: [
    main: [
    strategy: Cluster.Strategy.Epmd,
    config: [hosts: [:"ac1@127.0.0.1", :"ac2@127.0.0.1"]],
    connect: {:net_kernel, :connect, []},
  ]
]

config :quantum_demo, QuantumDemo.Scheduler,
  global: true,
  overlap: false,
  jobs: [
    [
      name: "cleaner",
      schedule: "* * * * *",
      task: {QuantumDemo, :run_cleaner, []},
      run_strategy: {Quantum.RunStrategy.Random, :cluster}
    ],
  ]
