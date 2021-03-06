% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/drug_pharmacology_parser.R
\name{drug_pharmacology}
\alias{drug_pharmacology}
\title{Drug Pharmacology parser}
\usage{
drug_pharmacology(
  save_table = FALSE,
  save_csv = FALSE,
  csv_path = ".",
  override_csv = FALSE,
  database_connection = NULL
)
}
\arguments{
\item{save_table}{boolean, save table in database if true.}

\item{save_csv}{boolean, save csv version of parsed tibble if true}

\item{csv_path}{location to save csv files into it, default is current
location, save_csv must be true}

\item{override_csv}{override existing csv, if any, in case it is true in the
new parse operation}

\item{database_connection}{DBI connection object that holds a connection to
user defined database. If \code{save_table} is enabled without providing
value for this function an error will be thrown.}
}
\value{
a tibble with the following variables:
\describe{
 \item{indication}{The approved conditions, diseases, or states for which a
 drug can safely and effectively be used. An indication is considered to be
 FDA-approved when it has any of the following designations: NDA, ANDA, BLA,
  or OTC. May also include indications in other countries, such as Canada
  (through Health Canada) or in Europe
  (through the European Medicines Agency).}
 \item{pharmacodynamics}{A description of how the drug modifies or affects
 the organism it is being used in. May include effects in the body that are
  desired (enzyme or protein targets for example) and undesired
  (also known as “side effects”). This is in contrast to pharmacokinetics,
   which describes how the body modifies the drug being used.}
 \item{mechanism_of_action}{A component of pharmacodynamics that describes
 the biochemical interaction through which a drug produces its intended
 effect. May include the exact molecular protein or enzyme targets and/or
 a description of the physiological effects produced.}
 \item{toxicity}{Any adverse reaction, or side effect, that may or may not
 occur with use of the drug. May be attributed to a number of effects
 including: an enhanced therapeutic effect, rare anaphylactic reactions,
  interactions with other medications, or unanticipated binding of the
  molecule at different sites within the body.}
 \item{metabolism}{A description of the chemical degradation of the drug
 molecule within the body; most commonly by enzymes from the
 Cytochrome P450 (CYP) system in the liver.}
 \item{absorption}{A description of the movement of the drug from the site
  of administration into the bloodstream or target tissue. Common
  pharmacokinetic metrics used to evaluate absorption include Area Under
  the Curve (AUC), bioavailability (F), maximum concentration (Cmax), and
  time to maximum concentration (Tmax).}
 \item{half-life}{The period of time it takes for the amount of drug in the
 body to be reduced by one half. Provides a description of how quickly the
 drug is being eliminated and how much is available in the bloodstream.}
 \item{protein-binding	}{A description of the drug’s affinity for plama
 proteins and the proportion of the drug that is bound to them when in
 circulation within the body.}
 \item{route_of_elimination}{A description of the pathway that is used to
 excrete the drug from the body. Common pharmacokinetic parameters used to
 evaluate excretion include elemination half life, renal clearance, and
 tracking of radiolabelled compounds through the renal and GI system.}
 \item{volume_of_distribution}{The Vd of a drug represents the degree to
 which it is distributed into body tissue compared to the plasma.}
 \item{clearance}{A pharmacokinetic measurement of the rate of removal of the
  drug from plasma, expressed as mL/min; reflects the rate of elimination of
   the drug.}
 \item{\emph{drugbank_id}}{drugbank id}
}
}
\description{
Describes the use, mechanism of action, pharmacokinetics, pharmacodynamics,
 and physiological or biochemical effects in the body.
}
\section{read_drugbank_xml_db}{

\code{\link{read_drugbank_xml_db}} function must be called first before any
parser.

If \code{\link{read_drugbank_xml_db}} is called before for any reason, so
no need to call it again before calling this function.
}

\examples{
\dontrun{
# the same parameters and usage will be applied for any parser
# return only the parsed tibble
run_all_parsers()

# will throw an error, as database_connection is NULL
run_all_parsers(save_table = TRUE)

# save in database in SQLite in memory database and return parsed tibble
sqlite_con <- DBI::dbConnect(RSQLite::SQLite())
run_all_parsers(save_table = TRUE, database_connection = sqlite_con)

# save parsed tibble as csv if it does not exist in current location,
# and return parsed tibble.
# if the csv exist before read it and return its data.
run_all_parsers(save_csv = TRUE)

# save in database, save parsed tibble as csv,
# if it does not exist in current location and return parsed tibble.
# if the csv exist before read it and return its data.
run_all_parsers(save_table = TRUE, save_csv = TRUE,
database_connection = sqlite_con)

# save parsed tibble as csv if it does not exist in given location,
# and return parsed tibble.
# if the csv exist before read it and return its data.
run_all_parsers(save_csv = TRUE, csv_path = TRUE)

# save parsed tibble as csv if it does not exist in current location and
# return parsed tibble.
# if the csv exist override it and return it.
run_all_parsers(save_csv = TRUE, csv_path = TRUE, override = TRUE)
}
}
\seealso{
Other drugs: 
\code{\link{drug_affected_organisms}()},
\code{\link{drug_ahfs_codes}()},
\code{\link{drug_atc_codes}()},
\code{\link{drug_calc_prop}()},
\code{\link{drug_categories}()},
\code{\link{drug_classification}()},
\code{\link{drug_dosages}()},
\code{\link{drug_ex_identity}()},
\code{\link{drug_exp_prop}()},
\code{\link{drug_external_links}()},
\code{\link{drug_food_interactions}()},
\code{\link{drug_general_information}()},
\code{\link{drug_groups}()},
\code{\link{drug_interactions}()},
\code{\link{drug_intern_brand}()},
\code{\link{drug_manufacturers}()},
\code{\link{drug_mixtures}()},
\code{\link{drug_packagers}()},
\code{\link{drug_patents}()},
\code{\link{drug_pdb_entries}()},
\code{\link{drug_prices}()},
\code{\link{drug_products}()},
\code{\link{drug_reactions_enzymes}()},
\code{\link{drug_reactions}()},
\code{\link{drug_salts}()},
\code{\link{drug_sequences}()},
\code{\link{drug_snp_adverse_reactions}()},
\code{\link{drug_snp_effects}()},
\code{\link{drug_syn}()}
}
\concept{drugs}
