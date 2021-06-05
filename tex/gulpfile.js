const { watch, series } = require('gulp');
const exec = require('child_process').execSync;

function buildtex(cb) {
	// console.log('something happened');
	exec('pdflatex math-exercises.tex');
	cb();
}

exports.default = function() {
  // All events will be watched
  watch('*.tex', { events: 'all' }, series(buildtex));
};
