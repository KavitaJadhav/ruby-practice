require 'byebug'

# Todo: fix short path method
#
class Vertex
  attr_reader :value

  def initialize(value)
    @value = value
  end
end

class Edge
  attr_reader :from, :to, :weight

  def initialize(from, to, weight)
    @from = from
    @to = to
    @weight = weight
  end
end

class Graph
  def initialize
    @nodedata = {}
  end

  def add_vertex(value)
    @nodedata[Vertex.new(value)] = []
  end

  def add_edge(from, to, weight)
    from_vertex = find_vertex(from)
    to_vertex = find_vertex(to)

    @nodedata[from_vertex] << Edge.new(from_vertex, to_vertex, weight)
    @nodedata[to_vertex] << Edge.new(to_vertex, from_vertex, weight)
  end

  def short_distance(from, to)
    #   one of the node not present
    #
    from_vertex = find_vertex(from)
    to_vertex = find_vertex(to)
    vertex_due_visit = all_vertexes
    vertex_visited = []

    distance_map = {}
    all_vertexes.each {|vertex| distance_map[vertex] = {distance: nil, path: nil}}
    distance_map[from_vertex].merge({distance: 0, path: nil})
    current_vertex = from_vertex

    while (vertex_due_visit) do
      # byebug
      vertex_visited.push(current_vertex)
      vertex_due_visit.delete(current_vertex)

      foo = []
      @nodedata[current_vertex].each do |edge|
        next if vertex_visited.include?(edge.to)

        distance = edge.weight
        distance_details = distance_map[edge.to]
        if distance_details[:distance]

          previous_vertext = distance_map[to_vertex][:path]
          while (previous_vertext) do
            distance += distance_map[previous_vertext][:distance]
            previous_vertext = distance_map[previous_vertext][:path]
          end

          if (distance > distance_details[:distance])
            distance_details.merge!({distance: distance, path: to_vertex})
            foo << {vertex: edge.to, distance: distance}
          end
        else
          distance_details.merge!({distance: distance, path: to_vertex})
          foo << {vertex: edge.to, distance: distance}
        end

      end
      # byebug
      current_vertex = foo.sort {|i| i[:distance]}.last[:vertex]
    end

    distance_map.each {|vertex, distance_data| puts "Distance from A to #{vertex.value} - #{distance_data[:distance]}, previous: #{distance_data[:path]}"}
  end


  private

  def all_vertexes
    @nodedata.keys
  end

  def find_vertex(value)
    @nodedata.keys.find {|node| node.value == value}
  end
end


graph = Graph.new
graph.add_vertex('A')
graph.add_vertex('B')
graph.add_vertex('C')
graph.add_vertex('D')
graph.add_vertex('E')

graph.add_edge('A', 'B', 2)
graph.add_edge('A', 'C', 5)
graph.add_edge('B', 'D', 4)
graph.add_edge('B', 'E', 6)
graph.add_edge('D', 'C', 3)
graph.add_edge('C', 'E', 5)

graph.short_distance('A', 'E')

a = 5
# vertex - value
# edge - from, to, weight
#
#