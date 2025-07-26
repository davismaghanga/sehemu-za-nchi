# app.py

import os
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

# Initialize Flask app
app = Flask(__name__)

# --- Database Configuration ---
# Replace with your actual database credentials
DB_USERNAME = os.environ.get('DB_USER', 'your_username')
DB_PASSWORD = os.environ.get('DB_PASSWORD', 'your_password')
DB_HOST = os.environ.get('DB_HOST', 'localhost')
DB_NAME = os.environ.get('DB_NAME', 'kenya_geography')

# Construct the database URI
app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{DB_USERNAME}:{DB_PASSWORD}@{DB_HOST}/{DB_NAME}'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy
db = SQLAlchemy(app)


# --- Database Models ---
# These models represent the tables in your database.

class Region(db.Model):
    """Represents the regions table."""
    __tablename__ = 'regions'
    id = db.Column(db.Integer, primary_key=True)
    region = db.Column(db.String(191), nullable=False)
    counties = db.relationship('County', backref='region', lazy=True)
    sub_counties = db.relationship('SubCounty', backref='region', lazy=True)

    def to_dict(self):
        """Serializes the object to a dictionary."""
        return {'id': self.id, 'region': self.region}

class County(db.Model):
    """Represents the counties table."""
    __tablename__ = 'counties'
    id = db.Column(db.Integer, primary_key=True)
    county = db.Column(db.String(191), nullable=False)
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'), nullable=False)
    sub_counties = db.relationship('SubCounty', backref='county', lazy=True)

    def to_dict(self):
        """Serializes the object to a dictionary."""
        return {
            'id': self.id,
            'county': self.county,
            'region_id': self.region_id
        }

class SubCounty(db.Model):
    """Represents the sub_counties table."""
    __tablename__ = 'sub_counties'
    id = db.Column(db.Integer, primary_key=True)
    subcounty = db.Column(db.String(191), nullable=False)
    county_id = db.Column(db.Integer, db.ForeignKey('counties.id'), nullable=False)
    region_id = db.Column(db.Integer, db.ForeignKey('regions.id'), nullable=False)

    def to_dict(self):
        """Serializes the object to a dictionary."""
        return {
            'id': self.id,
            'subcounty': self.subcounty,
            'county_id': self.county_id,
            'region_id': self.region_id
        }


# --- API Endpoints ---

@app.route('/api/regions', methods=['GET'])
def get_regions():
    """Fetches all regions."""
    try:
        regions = Region.query.all()
        return jsonify([region.to_dict() for region in regions])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/counties', methods=['GET'])
def get_counties():
    """Fetches all counties."""
    try:
        counties = County.query.all()
        return jsonify([county.to_dict() for county in counties])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/sub_counties', methods=['GET'])
def get_sub_counties():
    """Fetches all sub-counties."""
    try:
        sub_counties = SubCounty.query.all()
        return jsonify([sub_county.to_dict() for sub_county in sub_counties])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/regions/<int:region_id>/counties', methods=['GET'])
def get_counties_by_region(region_id):
    """Fetches all counties for a specific region."""
    try:
        counties = County.query.filter_by(region_id=region_id).all()
        if not counties:
            return jsonify({'message': 'No counties found for this region or region does not exist.'}), 404
        return jsonify([county.to_dict() for county in counties])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/counties/<int:county_id>/sub_counties', methods=['GET'])
def get_sub_counties_by_county(county_id):
    """Fetches all sub-counties for a specific county."""
    try:
        sub_counties = SubCounty.query.filter_by(county_id=county_id).all()
        if not sub_counties:
            return jsonify({'message': 'No sub-counties found for this county or county does not exist.'}), 404
        return jsonify([sub_county.to_dict() for sub_county in sub_counties])
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# --- Health Check Route ---
@app.route('/')
def index():
    """A simple health check endpoint."""
    return "Welcome to the Kenya Geographical API!"

# --- Main execution ---
if __name__ == '__main__':
    # It's recommended to use a production-ready server like Gunicorn
    # For development:
    app.run(debug=True, host='0.0.0.0')

