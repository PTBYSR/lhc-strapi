'use strict';

/**
 * couple service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::couple.couple');
