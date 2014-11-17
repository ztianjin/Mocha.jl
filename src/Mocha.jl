module Mocha

include("logging.jl")
include("config.jl")

if Config.use_native_extension
  include("native.jl")
end

include("macros.jl")
include("base.jl")

include("utils/blas.jl")
include("utils/math.jl")
include("utils/io.jl")
include("utils/hdf5.jl")

if Config.use_native_extension
  include("utils/im2col-native.jl")
else
  include("utils/im2col.jl")
end

include("backend.jl")
include("system.jl")
include("blob.jl")

if Config.use_cuda
  include("cuda/cuda.jl")
  include("cuda/cublas.jl")
  include("cuda/cudnn.jl")
  include("cuda/backend.jl")
  include("cuda/blob.jl")
end

include("initializers.jl")
include("regularizers.jl")
include("neurons.jl")

if Config.use_cuda
  include("cuda/regularizers.jl")
  include("cuda/neurons.jl")
end

include("pooling-functions.jl")
include("parameter.jl")

include("layers.jl")
if Config.use_cuda
  include("cuda/layers.jl")
end

if Config.use_native_extension
  include("layers/pooling/native-impl.jl")
else
  include("layers/pooling/julia-impl.jl")
end
include("layers/pooling/channel-pooling.jl")

include("net.jl")
include("coffee-break.jl")

include("solvers.jl")
if Config.use_cuda
  include("cuda/solvers.jl")
end

end # module
