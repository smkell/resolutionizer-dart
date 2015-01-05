/**
 * Created by Sean on 1/3/2015.
 */

module.exports = function(config) {
    config.set({
        basePath: '.',
        frameworks: ['dart-unittest'],

        files: [
            {pattern: 'test/resolutionizer_test.dart', included: true},
            {pattern: '**/*.dart', included: false},
            {pattern: '**/*.html', included: false}
        ],

        autoWatch: true,
        captureTimeout: 20000,
        browserNoActivityTimeout: 300000,

        plugins: [
            'karma-dart',
            'karma-chrome-launcher',
            'karma-phantomjs-launcher'
        ],

        browsers: ['Dartium']
    });
};