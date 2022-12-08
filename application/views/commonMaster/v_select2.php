<script>
    <?php if(isset($samaj)) { ?>
    function samajDD(samajId= '',select="#samaj_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Samaj/getSamajDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        samaj_id : samajId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Samaj',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

    <?php if(isset($member)) { ?>
    function memberDD(memberId= '',select="#member_id") {
        $(select).select2({
           ajax: {
                url: "<?= site_url('Member/getMemberDD') ?>",
               dataType: 'json',
               type: 'post',
               delay: 250,
               data: function (params) {
                   var memberId = $('#member_id').val();
                   return {
                       filter_param: params.term || '', // search term
                       page: params.page || 1,
                       member_id : memberId
                   };
               },
               processResults: function (data, params) {
                   return {
                       results: data.result,
                       pagination: {
                           more: (data.page * 10) < data.totalRows
                       }
                   };
               },
               //cache: true
           },

           escapeMarkup: function (markup) {
               return markup;
           }
        }).on('select2:select', function () {
           if ($("#" + $(this).attr('id')).valid()) {
               $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
           }
        });

    }
    <?php } ?>

    <?php if(isset($gallery)) { ?>
    function galleryDD(galleryId= '',select="#gallery_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Gallery/getGalleryDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '', // search term
                        galleryIdActive: galleryId,
                        galleryName: $('#gallery_name').val(),
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    // parse the results into the format expected by Select2
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data, except to indicate that infinite
                    // scrolling can be used
//                    params.page = params.page || 1;

                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                },
                //cache: true
            },
            placeholder: 'Search For Your Gallery',
            escapeMarkup: function (markup) {
                return markup;
            }, // let our custom formatter work
            //minimumInputLength: 2,
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>
    <?php if(isset($businessType)) { ?>
    function businessTypeDD(businessTypeId= '',select="#business_type_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('BusinessType/getBusinessTypeDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '', // search term
                        businessTypeIdActive: businessTypeId,
                        <?php if(isset($businessTypeName)) { ?>
                        businessTypeName: $('#business_type_name').val(),
                       <?php } ?>
                        page: params.page || 1,
                    };
                },
                processResults: function (data, params) {
                    // parse the results into the format expected by Select2
                    // since we are using custom formatting functions we do not need to
                    // alter the remote JSON data, except to indicate that infinite
                    // scrolling can be used
//                    params.page = params.page || 1;
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                },
                //cache: true
            },
            placeholder: 'Search For Your Business Type',
            escapeMarkup: function (markup) {
                return markup;
            }, // let our custom formatter work
            //minimumInputLength: 2,
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>



    function getMember(id = '', selectedValue='', selectFor = '#member_id'){

        $(selectFor).select2({
            width: 'style',
            allowClear: true,
            ajax: {
                url: "<?= base_url("Business/getMember"); ?>",
                dataType: 'json',
                type: 'POST',
                data: function (params) {
                    return {

                        search_term: params.term,
                        // filter_param: params.term, // search term
                        samaj_id: id,
                        member_id: selectedValue,
                    };

                },
                processResults: function (data, params) {
//                    params.page = params.page || 1;

                    return {
                        results: data,
//                        pagination: {
//                            more: (params.page * 30) < data.total_count
//                            more: true
//                        }
                    };
                },
                cache: true
            },

            placeholder: 'Search for a member',
            dropdownAutoWidth: true,
//            dropdownParent: $("#formModal<?//= (isset($modelFor) && ($modelFor != '')) ? $modelFor : '' ?>//"),
            escapeMarkup: function (markup) {
                return markup;
            }, // let our custom formatter work
        });

    }

    <?php if(isset($education)) { ?>
    function educationDD(educationId= '',select="#education_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Education/getEducationDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        samaj_id: $("#samaj_id").val(),
                        education_id : educationId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Education',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

    <?php if(isset($gender)) { ?>
    function genderDD(genderId= '',select="#gender_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Gender/getGenderDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        gender_id : genderId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Gender',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($occupation)) { ?>
    function occupationDD(occupationId= '',select="#occupation_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Occupation/getOccupationDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						occupation_id : occupationId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Occupation',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($employeeName)) { ?>
	function employeeNameDD(empId= '',select="#emp_dropdown") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('employee/getEmployeeListDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						emp_id : empId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					console.log("emp"+ data);
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows

						}
					};
				}
			},
			placeholder: 'Search For Your Employee',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>

	<?php if(isset($type)) { ?>
	function typeDD(typeId= '',select="#type_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('EmployeeType/getTypeDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						type_id : typeId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your Type',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>

	<?php if(isset($employeeName)) { ?>
    function nameEmployeeDD(empId= '',select="#emp_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Employee/getEmployeeListDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						emp_id : empId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Employee',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($project)) { ?>
	function projectDD(projectId= '',select="#project_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('Project/getProjectDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						project_id : projectId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your Project',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>

	<?php if(isset($task)) { ?>
	function taskDD(taskId= '',select="#task_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('Task/getTaskDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						project_id: $("#project_id").val(),
						task_id : taskId,

						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your Task',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>

	<?php if(isset($employeeShift)) { ?>
    function employeeShiftDD(shiftId= '',select="#shift_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('EmployeeShift/getEmployeeShiftDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						shift_id : shiftId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Shift',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

    <?php if(isset($native)) { ?>
    function nativeDD(nativeId= '',select="#native_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Native/getNativeDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        samaj_id: $("#samaj_id").val(),
                        native_id : nativeId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Native Place',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

    <?php if(isset($maritalStatus)) { ?>
    function maritalStatusDD(maritalStatusId= '',select="#marital_status_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('MaritalStatus/getMaritalStatusDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        marital_status_id : maritalStatusId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Marital Status',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>
    <?php if(isset($monk)) { ?>
    function monkDD(monkId= '',select="#monk_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Monk/getMonkDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        monk_id : monkId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows

                        }
                    };
                }
            },
            placeholder: 'Search For Your Monk',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

    <?php if(isset($surname)) { ?>
    function surnameDD(surnameId= '',select="#surname_id") {
        $("#surname_id").select2({
            width: 'style',
            allowClear: true,
            ajax: {
                url: "<?= base_url("Samaj/getSurname"); ?>",
                dataType: 'json',
                type: 'POST',
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        samaj_id: $("#samaj_id").val(),
                        surname_id: "<?= isset($getMemberData['surname']) && ($getMemberData['surname'] != '') ? $getMemberData['surname'] : 0 ?>"
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data,
                    };
                },
                cache: true
            },
            placeholder: 'Search for a samaj',
            <?php if(isset($model)){ ?>
            dropdownAutoWidth: true,
            <?php } ?>
            escapeMarkup: function (markup) {
                return markup;
            },
        });
    }
    <?php } ?>


	<?php if(isset($country)) { ?>
    function countryDD(countryId= '',select="#country_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Country/getCountryDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						country_id : countryId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Country',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($religion)) { ?>
    function religionDD(religionId= '',select="#religion_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Religion/getReligionDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						religion_id : religionId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Religion',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($branch)) { ?>
    function branchDD(branchId= '',select="#branch_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Branch/getBranchDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						branch_id : branchId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Branch',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($bloodGroup)) { ?>
    function bloodGroupDD(bloodGroupId= '',select="#blood_group_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('BloodGroup/getBloodGroupDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						blood_group_id : bloodGroupId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Blood Group',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($accountDetails)) { ?>
    function accountDetailsDD(accountDetailsId= '',select="#account_details_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('AccountDetails/getAccountDetailsDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						account_details_id : accountDetailsId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Account Details',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($department)) { ?>
    function departmentDD(departmentId= '',select="#department_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Department/getDepartmentDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						department_id : departmentId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Department',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($salary)) { ?>
    function salaryDD(salaryId= '',select="#salary_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Salary/getSalaryDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						salary_id : salaryId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Salary',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($role)) { ?>
    function roleDD(roleId= '',select="#role_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Role/getRoleDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						role_id : roleId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Role',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($workWeek)) { ?>
    function workWeekDD(workWeekId= '',select="#work_week_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('WorkWeek/getWorkWeekDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						work_week_id : workWeekId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Work Week',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($company)) { ?>
    function companyDD(companyId= '',select="#company_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Company/getCompanyDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						company_id : companyId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Work Week',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($state)) { ?>
	function stateDD(stateId= '',select="#state_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('State/getStateDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						country_id: $("#country_id").val(),
						state_id: "<?= isset($getMemberData['country']) && ($getMemberData['country'] != '') ? $getMemberData['country'] : 0 ?>"
						// page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your State',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>

    <?php if(isset($city)) { ?>
    function cityDD(cityId= '',select="#city_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('City/getCityDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        state_id: $("#state_id").val(),
                        city_id: "<?= isset($getMemberData['city']) && ($getMemberData['city'] != '') ? $getMemberData['city'] : 0 ?>"
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your City',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($caste)) { ?>
    function casteDD(casteId= '',select="#caste_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Caste/getCasteDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        religion_id: $("#religion_id").val(),
                        caste_id: "<?= isset($getMemberData['religion']) && ($getMemberData['religion'] != '') ? $getMemberData['religion'] : 0 ?>"
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Caste',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($section)) { ?>
	function sectionDD(sectionId= '',select="#section_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('Section/getSectionDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						section_id : sectionId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your Section',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
    <?php } ?>

	<?php if(isset($costCenter)) { ?>
	function costCenterDD(costCenterId= '',select="#cost_center_id") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('CostCenter/getCostCenterDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						cost_center_id : costCenterId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows
						}
					};
				}
			},
			placeholder: 'Search For Your Cost Center',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
    <?php } ?>

    <?php if(isset($relationship)) { ?>
    function relationshipDD(relationshipId= '',select="#relationship_master_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Relationship/getRelationshipDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
                        relationship_master_id : relationshipId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Relationship',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($leaveType)) { ?>
    function leaveTypeDD(leaveTypeId= '',select="#leave_type_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('LeaveType/getLeaveTypeDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						leave_type_id : leaveTypeId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Leave Type',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($leaveReason)) { ?>
    function leaveReasonDD(leaveReasonId= '',select="#leave_reason_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('LeaveReason/getLeaveReasonDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						leave_type_id : leaveReasonId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Leave Reason',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($designation)) { ?>
    function designationDD(designationId= '',select="#designation_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Designation/getDesignationDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						designation_id : designationId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Your Designation',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($employeeTypeFilter)) {  ?>
    function employeeTypeFilterDD(employeeTypeFilterId= '',select="#employeeTypeFilterId") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Employee/getemployeeTypeFilterDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						employeeTypeFilter_id : employeeTypeFilterId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Employee Type',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>

	<?php if(isset($leaveReasonFilter)) {  ?>
    function leaveReasonFilterDD(leaveReasonFilterId= '',select="#leaveReasonFilter_id") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('TimeSheet/getLeaveReasonFilterDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						leaveReasonFilter_id : leaveReasonFilterId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search For Leave Reason',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>
	
	
	<?php if(isset($teamHead)) { ?>
	function teamHeadDD(empId= '',select="#teamhead_dropdown") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('employee/getTeamHeadListDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						emp_id : empId,
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					console.log("emp"+ data);
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows

						}
					};
				}
			},
			placeholder: 'Search For Team Head',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>


	<?php if(isset($teamMeambers)) { ?>
	function teamMembersDD(empId= '',select="#teammembers_dropdown") {
		$(select).select2({
			ajax: {
				url: "<?= site_url('employee/getTeamMembersListDD') ?>",
				dataType: 'json',
				type: 'post',
				delay: 250,
				data: function (params) {
					return {
						filter_param: params.term || '',
						emp_id : empId,
						teamhead_id: $("#emphead").val(),
						page: params.page || 1
					};
				},
				processResults: function (data, params) {
					console.log("emp"+ data);
					return {
						results: data.result,
						pagination: {
							more: (data.page * 10) < data.totalRows

						}
					};
				}
			},
			placeholder: 'Search For Team Members',
			escapeMarkup: function (markup) {
				return markup;
			}
		}).on('select2:select', function () {
			if ($("#" + $(this).attr('id')).valid()) {
				$("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
			}
		});
	}
	<?php } ?>
	
	
	<?php if(isset($leaveStatus)) {  ?>
    function leaveStatusDD(leaveStatusId= '',select="#leaveStatusId") {
        $(select).select2({
            ajax: {
                url: "<?= site_url('Report/getLeaveStatusDD') ?>",
                dataType: 'json',
                type: 'post',
                delay: 250,
                data: function (params) {
                    return {
                        filter_param: params.term || '',
						leaveStatusid : leaveStatusId,
                        page: params.page || 1
                    };
                },
                processResults: function (data, params) {
                    return {
                        results: data.result,
                        pagination: {
                            more: (data.page * 10) < data.totalRows
                        }
                    };
                }
            },
            placeholder: 'Search Leave Status',
            escapeMarkup: function (markup) {
                return markup;
            }
        }).on('select2:select', function () {
            if ($("#" + $(this).attr('id')).valid()) {
                $("#" + $(this).attr('id')).removeClass('invalid').addClass('success');
            }
        });
    }
    <?php } ?>


</script>



