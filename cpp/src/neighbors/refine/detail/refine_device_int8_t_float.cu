
/*
 * Copyright (c) 2023, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * NOTE: this file is generated by refine_00_generate.py
 *
 * Make changes there and run in this directory:
 *
 * > python refine_00_generate.py
 *
 */

#include <cuvs/neighbors/refine.hpp>

#include "../refine_device.cuh"

#define instantiate_cuvs_neighbors_refine(idx_t, data_t, distance_t, matrix_idx)            \
  void cuvs::neighbors::refine(                                                             \
    raft::resources const& handle,                                                          \
    raft::device_matrix_view<const data_t, matrix_idx, raft::row_major> dataset,            \
    raft::device_matrix_view<const data_t, matrix_idx, raft::row_major> queries,            \
    raft::device_matrix_view<const idx_t, matrix_idx, raft::row_major> neighbor_candidates, \
    raft::device_matrix_view<idx_t, matrix_idx, raft::row_major> indices,                   \
    raft::device_matrix_view<distance_t, matrix_idx, raft::row_major> distances,            \
    cuvs::distance::DistanceType metric)                                                    \
  {                                                                                         \
    refine_impl<idx_t, data_t, distance_t, matrix_idx>(                                     \
      handle, dataset, queries, neighbor_candidates, indices, distances, metric);           \
  }

instantiate_cuvs_neighbors_refine(int64_t, int8_t, float, int64_t);

#undef instantiate_cuvs_neighbors_refine
