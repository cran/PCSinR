% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api.r
\name{PCS_run}
\alias{PCS_run}
\title{Simulate the run of a PCS model}
\usage{
PCS_run(interconnection_matrix, initial_state, resting_levels, reset,
  node_names = NULL, stability_criterion = 10^-6, max_iterations = Inf,
  convergence_criteria = c(PCS_convergence_McCandR),
  convergence_names = NULL)
}
\arguments{
\item{interconnection_matrix}{A square, matrix representing the link weights
between nodes, such that each entry w_ij represents the link strength
between nodes i and j. Accordingly, for a network of n nodes, the matrix
must be of six n*n. In most applications, the matrix will be symmetric,
meaning that links are bidirectional.}

\item{initial_state}{Initial node activations before the first iteration is
run. In most cases, this will be a vector of zeros, with the length
corresponding to the number of nodes in the network.}

\item{resting_levels}{Resting activation level for each node. In most cases,
this will be a vector of zeros, with its length corresponding to the number
of nodes in the network.}

\item{reset}{Vector denoting nodes with stable activation values. The vector
contains a value for each node; if it is unequal to zero, the node
activation will be reset to this value after each iteration.}

\item{node_names}{Vector specifying human-readable labels for every node, or
\code{'default'}, in which case nodes are automatically named.}

\item{stability_criterion}{Stability theshold for convergence criteria. If
energy changes across iterations fall below this threshold, the model is
considered to have converged.}

\item{max_iterations}{Maximum number of iterations to run before terminating
the simulation.}

\item{convergence_criteria}{Array of convergence criteria to apply. This PCS
implementation allows users to define and observe multiple convergence
criteria in one model. Each entry in this array is a convergence criterion,
which is representated as a function that receives the current iteration,
energy, model state history and the \code{stability_criterion} defined
above and returns a boolean value representing whether the particular
criterion is met given the model's current state.}

\item{convergence_names}{Human-readable labels for the convergence criteria,
or \code{'default'}, in which case the criteria are numbered automatically,
in which case the criteria are numbered automatically.}
}
\value{
A list representing the model state after all convergence criteria
  have been fullfilled. The key \code{iterations} contains the model state
  over its entire run, while the key \code{convergence} defines which
  convergence criteria have been met at which iteration. Together, these
  provide an exhaustive summary of the model's behavior.
}
\description{
\code{PCS_run} simulates a PCS network given a pre-specified interconnection
matrix and model parameters, according to the mechanism outlines by
McClelland and Rumelhart (1981).
}

